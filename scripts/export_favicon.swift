#!/usr/bin/env swift
// Generate matching SVG and ICO favicons with native macOS graphics.
// Run from the repository root: swift scripts/export_favicon.swift

import Foundation
import CoreGraphics
import ImageIO

enum Segment {
    case move(CGFloat, CGFloat)
    case line(CGFloat, CGFloat)
    case curve(CGFloat, CGFloat, CGFloat, CGFloat, CGFloat, CGFloat)
}

let background = "#111616"
let accent = "#9bddc8"
let strandWidth: CGFloat = 6
let rungWidth: CGFloat = 4.8
let strands: [Segment] = [
    .move(16, 9), .curve(16, 28, 48, 36, 48, 55),
    .move(48, 9), .curve(48, 28, 16, 36, 16, 55)
]
let rungs: [Segment] = [
    .move(16, 9), .line(48, 9),
    .move(21, 21.53125), .line(43, 21.53125),
    .move(21, 42.46875), .line(43, 42.46875),
    .move(16, 55), .line(48, 55)
]

func svgPath(_ segments: [Segment]) -> String {
    segments.map { segment in
        switch segment {
        case .move(let x, let y): return "M\(x) \(y)"
        case .line(let x, let y): return "L\(x) \(y)"
        case .curve(let x1, let y1, let x2, let y2, let x, let y):
            return "C\(x1) \(y1) \(x2) \(y2) \(x) \(y)"
        }
    }.joined(separator: " ")
}

func drawPath(_ segments: [Segment], width: CGFloat, in context: CGContext) {
    context.beginPath()
    for segment in segments {
        switch segment {
        case .move(let x, let y): context.move(to: CGPoint(x: x, y: y))
        case .line(let x, let y): context.addLine(to: CGPoint(x: x, y: y))
        case .curve(let x1, let y1, let x2, let y2, let x, let y):
            context.addCurve(to: CGPoint(x: x, y: y),
                             control1: CGPoint(x: x1, y: y1),
                             control2: CGPoint(x: x2, y: y2))
        }
    }
    context.setLineWidth(width)
    context.strokePath()
}

func color(_ hex: String) -> CGColor {
    let value = UInt32(hex.dropFirst(), radix: 16)!
    return CGColor(red: CGFloat((value >> 16) & 255) / 255,
                   green: CGFloat((value >> 8) & 255) / 255,
                   blue: CGFloat(value & 255) / 255, alpha: 1)
}

let svg = """
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64">
  <title>DNA helix</title>
  <circle cx="32" cy="32" r="32" fill="\(background)"/>
  <g fill="none" stroke="\(accent)" stroke-linecap="round" stroke-linejoin="round">
    <path d="\(svgPath(strands))" stroke-width="\(strandWidth)"/>
    <path d="\(svgPath(rungs))" stroke-width="\(rungWidth)"/>
  </g>
</svg>

"""

do {
    try svg.write(toFile: "favicon.svg", atomically: true, encoding: .utf8)
    guard let space = CGColorSpace(name: CGColorSpace.sRGB),
          let encoder = CGImageDestinationCreateWithURL(
            URL(fileURLWithPath: "favicon.ico") as CFURL, "com.microsoft.ico" as CFString, 3, nil
          ) else { throw NSError(domain: "FaviconExport", code: 1) }
    for size in [16, 32, 48] {
        guard let context = CGContext(data: nil, width: size, height: size,
                                      bitsPerComponent: 8, bytesPerRow: 0, space: space,
                                      bitmapInfo: CGImageAlphaInfo.premultipliedLast.rawValue)
        else { throw NSError(domain: "FaviconExport", code: 2) }
        context.clear(CGRect(x: 0, y: 0, width: size, height: size))
        // SVG coordinates start at the top left; Core Graphics starts below.
        context.translateBy(x: 0, y: CGFloat(size))
        context.scaleBy(x: CGFloat(size) / 64, y: -CGFloat(size) / 64)
        context.setFillColor(color(background))
        context.fillEllipse(in: CGRect(x: 0, y: 0, width: 64, height: 64))
        context.setStrokeColor(color(accent))
        context.setLineCap(.round)
        context.setLineJoin(.round)
        drawPath(strands, width: strandWidth, in: context)
        drawPath(rungs, width: rungWidth, in: context)
        guard let image = context.makeImage() else { throw NSError(domain: "FaviconExport", code: 3) }
        CGImageDestinationAddImage(encoder, image, nil)
    }
    guard CGImageDestinationFinalize(encoder) else { throw NSError(domain: "FaviconExport", code: 4) }
    print("Exported favicon.svg and favicon.ico (16, 32, and 48 pixels).")
} catch {
    fputs("Favicon export failed: \(error)\n", stderr)
    exit(1)
}
