#import "tum-font.typ": font-sizes, tum-font
#import "utils.typ": format-title-section-before-chapters

#let print-bibliography(bib-sources) = [
  #set text(font: tum-font, size: font-sizes.base)

  #show heading.where(level: 1): it => {
    set text(font: tum-font, size: font-sizes.h1)
    strong(it)
  }

  #if not bib-sources.starts-with("/") {
    bibliography("/" + bib-sources)
  } else {
    bibliography(bib-sources)
  }
]
