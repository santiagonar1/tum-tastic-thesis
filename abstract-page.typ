#import "page-conf.typ": content-page-margins, tum-page
#import "tum-font.typ": font-sizes, tum-font

#let print-abstract(body) = [
  // --------------  Sets  --------------
  #set text(font: tum-font)

  #let margins = content-page-margins
  #set page(
    paper: tum-page.type,
    margin: margins,
  )

  #set text(font: tum-font)
  #set par(justify: true, first-line-indent: 1em)

  // -------------- Content --------------
  #show heading.where(level: 1): it => {
    set text(font: tum-font, size: font-sizes.h1)
    v(2em)
    strong(it)
    v(0.5em)
  }

  = Abstract
  #body
]

#let body = [
  #lorem(120)

  #lorem(200)
]

#print-abstract(body)