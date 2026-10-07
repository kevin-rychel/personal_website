# Landing page copy review

Edit the text directly below each label. This is a copy review document, not a file the website reads automatically; edits are applied manually to the HTML. You don’t need to keep the Markdown formatting perfect.

The October 2026 review is now implemented, including the agreed “across microbial species” and publication-count wording. Your layout notes remain here for reference and further edits.

Use each **Layout notes** area for design requests, questions, or instructions such as “remove this paragraph” or “combine these sections.” You can leave any unchanged text alone. Links list both their visible label and destination. Decorative arrows are omitted. A new line in a heading reflects its current visual line break; we can change those freely.

## Overall notes

**Layout notes:**

<!-- Add general notes here. -->

**Image direction already discussed:** Use close-up crops of the full-resolution colorectal carcinoma image for more integrated banners or visual elements. Marketing permission for wide sharing is confirmed. The page now uses responsive crops of the supplied master and a larger portrait exported from the supplied high-resolution headshot.

**October 6 layout changes applied:** Two equal-height, full-width tissue banners now frame the introduction and specialties, with separate mobile crops. The phone portrait is centered inside the first banner for this review. Navigation and introductory labels are larger, opening spacing is tighter, and specialties stay in two balanced pairs when wrapping. Selected work has a compact introduction on the left; story 1’s scale diagram appears left on desktop and above the text on phones. The iModulon illustration has a short horizontal connector centered on the RNAseq matrix and seven genes in module 2. All page headings now end with periods. Earlier notes below remain as review history.

## 1. Header and navigation

**Name / home link:** Kevin Rychel-Penn.

**Navigation links:**

- [Work](#work)
- [Publications](#publications)
- [About](#about)

**Layout notes:**

Increase the size of my name.

## 2. Opening / hero

**Small introductory label:**

Computational biologist & data scientist <!-- Caps, accent cyan as shown>

San Diego, California <!-- Light gray, not sure if caps or title case works better...>

**Main heading:**

Making sense of
complex biology.

**Introduction:**

I’m Kevin, a PhD bioengineer working across spatial biology and multi-omics. I build reproducible analysis tools that turn complex measurements into interpretable biological insight.

**Primary button:** [Get in touch](mailto:kevinrychelpenn@gmail.com)

**Résumé link:** [Résumé](resume.pdf) — small suffix: PDF

**Profile links:**

- [LinkedIn](https://www.linkedin.com/in/kevin-rychel/)
- [Scholar](https://scholar.google.com/citations?user=3QBkyHcAAAAJ&hl=en)

**Text over the microscopy image:**

<!-- Delete this! -->

**Microscopy caption:**

Multiplex imaging · colorectal carcinoma

**Name beside the portrait:**

Kevin Rychel-Penn, PhD <!-- Not sure we have space for this in the new layout, fine to remove>

**Location beside the portrait:**

<!-- Move to a second line of the small intro label -->

**Specialties below the opening:**

Spatial biology / Multi-omics / Scientific software / Communication

**Layout notes:**

Let's try a full width banner made from zooming in in the upper right part of the crc image (the cancerous orange/blue area), where cellular detail can be made out. On phone screens, this banner could be approximately where the "Computational Biologist... complex biology." heading is. For med/large screens, we could roughly double the current margin between the horizontal line and the header, and add this banner there (minus smaller vertical margins). Then on phones, let's put the circle with my face in it centered floating over the banner, and much larger than it currently is. For med/large, my headshot is instead where the current crc image is, so much larger. Since the headshot is moving, the text that was next to it needs a new home -- simply make my name in the header larger, and add the location to a second line of the introductory label for now.

## 3. Selected work — introduction

**Small section label:**

Selected work

**Heading:**

From big datasets
to clear insights.

**Introduction:**

I connect biological questions with rigorous analysis, tools people can use, and detailed explanations that illuminate the secrets hidden in datasets. <!-- Generally, using the word "matter" the way you did here gives me an AI vibe; trying to avoid those sorts of tells -->

**Layout notes:**

Here we should add a more square-ish crop of the crc image, but from the lower left area, include some of the rounded healthy orange epithelium and some of the cyan tertiary lymphoid structure. Avoid the very lower left where there is more black background and some focus artifacts. The image goes to the side on the med/large screens (not sure if right or left of the text is better, given that my headshot will be large on the right just above this), and below the text on small screens.

## 4. Spatial biology project

**Project number:** 01

**Category:**

Spatial biology & quantitative imaging

**Heading:**

Exploring spatial landscapes
across diverse tissues and diseases.

**Description:**

At Miltenyi Biotec, I develop analysis workflows for multiplex imaging of diverse tissues — from image QC and cell typing to spatial analysis and scientific visualization. My colorectal carcinoma webinar shows how unsupervised analysis can help interpret a 61-plex protein imaging study.

**Link:** [Watch the spatial biology webinar](https://www.selectscience.net/webinar/high-plex-high-impact-the-power-of-unsupervised-data-analytics-to-guide-discovery-in-spatial-biology)

**Diagram heading:**

Connecting the scales

**Diagram labels:**

- Measurements — Protein expression
- Phenotypes — Cell types & states
- Neighborhoods — Tissue organization

**Layout notes:**

Eventually we may update the icons here (especially the tissue organization one), but I think they are good for now. Love the colors and how they synergize with the crc image

## 5. DAWN / DUSK project

**Project number:** 02

**Category:**

Scientific software

**Heading:**

Good analysis should
be repeatable.

**Description:**

I built DAWN and DUSK codebases to make spatial analysis reproducible across datasets. Guided workflows preserve visual checkpoints with a human-in-the-loop interface; Python tools then support cohort-level statistics and publication-ready figures.

**Link:** [Watch the workflow webinar](https://events.bitesizebio.com/scaling-up-spatial-biology-analysis/)

**Illustration caption:**

Workflow overview · conceptual illustration

**Text inside the illustration:**

- DAWN
- Guided workflows
- <!-- Leaning towards deleting this one: Visual checkpoint -->
- DUSK
- Cohort insights

**Layout notes:**

Very happy with this one! Still might tweak the image a little, but for now two minor changes: remove the words visual checkpoint, and make the data show a stronger effect size between cohorts... i.e. keep the cyan dots where they are, move the orange dots up a bit and give them slightly more variance, and then move the purple dots down a little bit and decrease their variance slightly. As it stands now, it takes a second to realize that we are comparing data because the three sets of points are so similar.

## 6. iModulonDB project

**Project number:** 03

**Category:**

Transcriptomics & systems biology

**Heading:**

Finding structure in gene expression
across microbial species.

**Description:**

During my PhD at UC San Diego, I developed iModulonDB 1.0, an interactive resource for exploring microbial gene regulation inferred from transcriptomic data. I also co-led the Genome Analytics group, connecting research, mentorship, and scientific software.

**Link:** [Explore iModulonDB](https://imodulondb.org/)

**Illustration caption:**

Transcriptional modules · conceptual illustration

**Text inside the illustration:**

- RNAseq data <!-- Label the matrix -->
- iModulon 1
- iModulon 2
- iModulon 3

**Layout notes:**

A few changes to the image: first, move the heatmap to the upper left and add the "RNAseq data" label under it. Keep the matrix itself the same, it's pretty good! Still include the squiggly dotted line pointing toward the modules. For the modules themselves, change the label to "iModulon". For the lines you have:

- Keep the ones that connect the large central dots (regulators) to the dots around them (genes)
- Also keep the dotted ovals/circles around the modules
- Remove the lines that connect the small circles to each other (gene:gene interactions not modeled). This includes the same-color genes and the lines connecting genes from different modules
- Add two new cross-module lines: Both come from iModulon 2's regulator and touch the nearest genes from iModulon 1 and 3. This represents a master regulator, where an iModulon can exert influence on genes that are predominantly part of another main iModulon. This bullet point is optional.

Hopefully this makes sense -- just don't want to misrepresent the method here! It's so close, very cool idea.

## 7. Publications

**Small section label:**

Selected publications

**Heading:**

Every dataset has
a story.

**Introduction:**

Four first-author papers spanning transcriptional regulation, scientific resources, and laboratory evolution. 30+ peer-reviewed publications and 1,000+ citations.

**Link:** [All publications on Scholar](https://scholar.google.com/citations?user=3QBkyHcAAAAJ&hl=en)

Each publication row links to its DOI. Asterisks mark italicized species names.

### Publication 1

**Year / journal:** 2025 · Genome Biology and Evolution

**Title:** Laboratory evolution reveals transcriptional mechanisms underlying thermal adaptation of *Escherichia coli*.

**Destination:** https://doi.org/10.1093/gbe/evaf171

### Publication 2

**Year / journal:** 2023 · Cell Reports

**Title:** Laboratory evolution, transcriptomics, and modeling reveal mechanisms of paraquat tolerance.

**Destination:** https://doi.org/10.1016/j.celrep.2023.113105

### Publication 3

**Year / journal:** 2021 · Nucleic Acids Research

**Title:** iModulonDB: a knowledgebase of microbial transcriptional regulation derived from machine learning.

**Destination:** https://doi.org/10.1093/nar/gkaa810

### Publication 4

**Year / journal:** 2020 · Nature Communications

**Title:** Machine learning uncovers independently regulated modules in the *Bacillus subtilis* transcriptome.

**Destination:** https://doi.org/10.1038/s41467-020-20153-9

**Layout notes:**

<!-- Add notes here. -->

## 8. About

**Small section label:**

Get to know me

**Heading:**

For me, curiosity
is personal.

**Location label:**

<!-- I think this little city label can be removed -->

**Paragraph 1:**

I was originally inspired to become a bioengineer by my Mom, Lora. Her experience suffering from multiple sclerosis led to a dream to treat disease and improve lives.

**Paragraph 2:**

I live in San Diego with my incredible husband, Sean. When I'm not diving into data, I love to travel around the world or unwind with a cocktail I've crafted. I also stay active with yoga, running, and weightlifting. I’m fascinated by astronomy and cosmology, and I’m continuing to develop my Spanish.

**Paragraph 3:**

I’m drawn to collaborative research that connects biological measurements, rigorous analysis, and useful software.

**Layout notes:**

<!-- Add notes here. -->

## 9. Contact

**Small section label:**

Let’s connect

**Heading:**

Good science starts
with a conversation.

**Email link:** [kevinrychelpenn@gmail.com](mailto:kevinrychelpenn@gmail.com)

**Layout notes:**

<!-- Add notes here. -->

## 10. Footer

**Footer text:**

Kevin Rychel-Penn · Biology. Big data. Clear, impactful insights.

**Link:** [Site source](https://github.com/kevin-rychel/personal_website)

**Layout notes:**

<!-- Add notes here. -->

## 11. Search and sharing text — optional

This text appears in the browser tab, search results, or shared-link previews rather than the main page.

**Browser title and shared-link title:**

Kevin Rychel-Penn — Computational Biology & Data Science

**Search description:**

Kevin Rychel-Penn is a computational biologist and data scientist working across spatial biology, multi-omics, quantitative imaging, and scientific software.

**Shared-link description:**

Making sense of complex biology through rigorous analysis, reproducible tools, and clear scientific communication.

**Shared-link image description:**

Kevin Rychel-Penn

**Notes:**

<!-- Add notes here. -->

## 12. Image descriptions and accessibility text — optional

These descriptions support screen readers. The two diagrams are conceptual illustrations; keep that distinction if rewriting their descriptions or captions.

**Microscopy image — banner:**

Close-up multiplex immunofluorescence image of colorectal carcinoma tissue, with orange epithelial structures, blue stroma, and yellow immune cells.

**Microscopy image — selected work:**

Multiplex image of colorectal tissue with contrasting orange epithelium and blue stroma, pink immune cells, and a cyan lymphoid region at the left edge.

**Portrait:**

Kevin Rychel-Penn smiling outdoors.

**Workflow illustration:**

Conceptual workflow connecting DAWN guided analysis and visual validation with DUSK cohort-level insights.

**Regulatory modules illustration:**

Conceptual illustration of genes organized into independently regulated transcriptional modules.

**Workflow SVG title:**

Conceptual analysis workflow

**Workflow SVG description:**

A schematic path from DAWN guided workflows through a visual checkpoint to DUSK cohort insights. The marks are illustrative and do not represent data or a software interface. <!-- good to keep as-is even though we removed the words from the image -->

**Regulatory modules SVG title:**

Conceptual overview of regulatory modules

**Regulatory modules SVG description:**

A small abstract data matrix is decomposed into three groups of genes that share common regulators. This conceptual illustration does not show measured results or an inferred biological network.

**Other accessible labels:**

- Skip link: Skip to content
- Home link: Kevin Rychel-Penn, back to top
- Navigation: Main navigation
- Profile links: Professional profiles
- Specialties: Areas of work
- Spatial diagram: Analysis connects protein measurements, cell phenotypes, and spatial context

**Notes:**

<!-- Add notes here. -->
