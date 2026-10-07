#!/usr/bin/env swift
// macOS-only, dependency-free exports from the supplied image masters.
// Run from the repository root: swift scripts/export_images.swift
// Use --microscopy-only to leave portrait exports untouched, or --family NAME
// to export only one of the named image families listed below.
// Originals are never modified; crop coordinates use pixels from the top left.
// Scientific imagery is only cropped, resized, and compressed. No pixels
// are generated or retouched. Web exports carry no original EXIF/GPS metadata.

import Foundation
import CoreGraphics
import ImageIO

struct Export {
    let name: String
    let crop: CGRect
    let widths: [Int]
    let quality: Double
}

enum ExportError: Error, CustomStringConvertible {
    case failure(String)
    var description: String {
        switch self { case .failure(let message): return message }
    }
}

let destination = URL(fileURLWithPath: "images", isDirectory: true)
let microscopyExports = [
    // Lower mixed carcinoma: orange epithelium, blue tissue, and yellow cells.
    Export(name: "crc-banner", crop: CGRect(x: 8400, y: 5800, width: 9600, height: 1600),
           widths: [800, 1600, 2400], quality: 0.88),
    // Shifted down and left, with a slightly wider field for phones (2:1).
    Export(name: "crc-banner-mobile", crop: CGRect(x: 9600, y: 5000, width: 5600, height: 2800),
           widths: [640, 1280], quality: 0.88),
    // Lower-right tissue, with the cyan lymphoid structure at the left edge
    // and pink cells appearing among orange epithelium and blue tissue.
    Export(name: "crc-work-banner", crop: CGRect(x: 8200, y: 11400, width: 9900, height: 1650),
           widths: [800, 1600, 2400], quality: 0.88),
    Export(name: "crc-work-banner-mobile", crop: CGRect(x: 8600, y: 10800, width: 7600, height: 3800),
           widths: [640, 1280], quality: 0.88)
]
let portraitExports = [
    // Square composition centers Kevin's face with room above and at shoulders.
    Export(name: "kevin-portrait", crop: CGRect(x: 2250, y: 0, width: 5700, height: 5700),
           widths: [400, 800, 1200], quality: 0.87)
]

func export(sourcePath: String, variants: [Export]) throws {
    let sourceURL = URL(fileURLWithPath: sourcePath)
    guard let source = CGImageSourceCreateWithURL(sourceURL as CFURL, nil),
          let original = CGImageSourceCreateImageAtIndex(source, 0, nil) else {
        throw ExportError.failure("Cannot read master: \(sourcePath)")
    }
    print("Source: \(sourcePath) (\(original.width) × \(original.height))")
    let bounds = CGRect(x: 0, y: 0, width: original.width, height: original.height)
    for variant in variants {
        guard bounds.contains(variant.crop), let cropped = original.cropping(to: variant.crop) else {
            throw ExportError.failure("Crop outside source: \(variant.name)")
        }
        let familyDestination = destination.appendingPathComponent(variant.name, isDirectory: true)
        try FileManager.default.createDirectory(at: familyDestination, withIntermediateDirectories: true)
        for width in variant.widths {
            try autoreleasepool {
                let roundedHeight = Int((Double(width) * variant.crop.height / variant.crop.width).rounded())
                // ImageIO tiles larger AVIFs. Odd grid heights can decode as an
                // empty image in Chromium, so use even output dimensions.
                let height = ((roundedHeight + 1) / 2) * 2
                guard width <= Int(variant.crop.width), height <= Int(variant.crop.height) else {
                    throw ExportError.failure("Export would upscale: \(variant.name)")
                }
                guard let colorSpace = CGColorSpace(name: CGColorSpace.sRGB),
                      let context = CGContext(data: nil, width: width, height: height,
                                              bitsPerComponent: 8, bytesPerRow: 0,
                                              space: colorSpace,
                                              bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue) else {
                    throw ExportError.failure("Cannot create resize context")
                }
                // Web assets are opaque; define every alpha byte rather than
                // leaving unused RGBX bytes unspecified for the image encoders.
                context.setFillColor(red: 0, green: 0, blue: 0, alpha: 1)
                context.fill(CGRect(x: 0, y: 0, width: width, height: height))
                context.interpolationQuality = .high
                context.draw(cropped, in: CGRect(x: 0, y: 0, width: width, height: height))
                guard let resized = context.makeImage() else {
                    throw ExportError.failure("Cannot resize: \(variant.name)")
                }
                // AVIF is the preferred delivery format; JPEG is the fallback.
                // Both encode directly from the resized original, never each other.
                for (type, suffix, quality) in [
                    ("public.jpeg", "jpg", variant.quality),
                    ("public.avif", "avif", 0.68)
                ] {
                    let output = familyDestination.appendingPathComponent("\(variant.name)-\(width).\(suffix)")
                    guard let encoder = CGImageDestinationCreateWithURL(output as CFURL,
                                          type as CFString, 1, nil) else {
                        throw ExportError.failure("Cannot write \(suffix): \(output.path)")
                    }
                    CGImageDestinationAddImage(encoder, resized, [
                        kCGImageDestinationLossyCompressionQuality: quality
                    ] as CFDictionary)
                    guard CGImageDestinationFinalize(encoder) else {
                        throw ExportError.failure("Failed encoding: \(output.path)")
                    }
                    let attributes = try FileManager.default.attributesOfItem(atPath: output.path)
                    let bytes = attributes[.size] as? Int ?? 0
                    print("  \(output.lastPathComponent): \(width) × \(height), \(bytes) bytes")
                }
            }
        }
    }
}

do {
    var microscopyOnly = false
    var family: String?
    let arguments = Array(CommandLine.arguments.dropFirst())
    var argumentIndex = 0
    while argumentIndex < arguments.count {
        switch arguments[argumentIndex] {
        case "--microscopy-only":
            microscopyOnly = true
        case "--family":
            argumentIndex += 1
            guard argumentIndex < arguments.count else {
                throw ExportError.failure("--family requires an image family name")
            }
            family = arguments[argumentIndex]
        case "--help":
            print("Usage: swift scripts/export_images.swift [--microscopy-only] [--family NAME]")
            print("Families: " + (microscopyExports + portraitExports).map { $0.name }.joined(separator: ", "))
            exit(0)
        default:
            throw ExportError.failure("Unknown argument: \(arguments[argumentIndex])")
        }
        argumentIndex += 1
    }
    let allowed = microscopyExports + (microscopyOnly ? [] : portraitExports)
    if let family = family, !allowed.contains(where: { $0.name == family }) {
        throw ExportError.failure("Unknown or excluded image family: \(family)")
    }
    let microscopy = microscopyExports.filter { family == nil || $0.name == family }
    let portraits = microscopyOnly ? [] : portraitExports.filter { family == nil || $0.name == family }
    if !microscopy.isEmpty {
        try autoreleasepool {
            try export(sourcePath: "images/masters/hd_colorectal_carcinoma.png", variants: microscopy)
        }
    }
    if !portraits.isEmpty {
        try autoreleasepool {
            try export(sourcePath: "images/masters/hd_kevinrychelpenn_dec2025_headshot.jpg", variants: portraits)
        }
    }
} catch {
    fputs("Image export failed: \(error)\n", stderr)
    exit(1)
}
