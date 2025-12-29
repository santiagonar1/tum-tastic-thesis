#import "tum-font.typ": font-sizes, tum-font
#import "utils.typ": format-title-section-before-chapters

#let print-index() = [
  // --------------  Sets  --------------
  #show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(it.prefix(), text(
      weight: "bold",
      font: tum-font,
      size: font-sizes.base,
    )[#it.inner()]),
  )

  #show outline.entry: set text(font: tum-font, size: font-sizes.base)

  // --------------  Content  --------------
  #outline(title: [Content])
]
