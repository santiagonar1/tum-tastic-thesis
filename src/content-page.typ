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


  // We need to reset the show rule in case this is called from a document 
  // where this was already set. Otherwise both rules will stack
  #show heading.where(level: 1): it => it.body

  #show heading.where(level: 1): it => {
    set text(font: tum-font, size: font-sizes.h1)
    v(2em)
    strong(it)
    v(1em)
  }

  // --------------  Content  --------------
  #outline(title: [Content])
]

#print-index()
