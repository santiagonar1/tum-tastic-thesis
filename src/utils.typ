#import "page-conf.typ": content-page-margins, first-line-indent, tum-page
#import "tum-font.typ": font-sizes, tum-font

#let check-keys(error-preamble, expected-keys, dict) = {
  for key in expected-keys [
    #if key not in dict {
      let error-msg = "[" + error-preamble + "] Missing required key: " + key
      panic(error-msg)
    }
  ]
}

#let print-section-before-chapters(title: "Title", body) = [
  // --------------  Sets  --------------
  #set text(font: tum-font)

  #let margins = content-page-margins
  #set page(
    paper: tum-page.type,
    margin: margins,
  )

  #set text(font: tum-font)

  #set par(justify: true, first-line-indent: first-line-indent)

  #set heading(numbering: none)

  #show heading.where(level: 1): it => {
    set text(font: tum-font, size: font-sizes.h1)
    v(2em)
    strong(it)
    v(0.5em)
  }
  // -------------- Content --------------

  = #title
  #body
]
