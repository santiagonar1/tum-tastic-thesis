#import "tum-font.typ": font-sizes, tum-font

#let print-index() = [
  #show outline.entry.where(level: 1): it => link(
    it.element.location(),
    it.indented(it.prefix(), text(
      weight: "bold",
      font: tum-font,
      size: font-sizes.base,
    )[#it.inner()]),
  )

  #show outline.entry: set text(font: tum-font, size: font-sizes.base)

  #let outline-title = [
    #show heading.where(level: 1): it => {
      set text(font: tum-font, size: font-sizes.h1)
      v(2em)
      strong(it)
      v(0.5em)
    }
    = Contents
  ]
  #outline(title: outline-title)
]
