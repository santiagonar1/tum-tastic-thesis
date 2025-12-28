#import "tum-header.typ": tum-logo-height

#let tum-page = (
  type: "a4",
  height: 297mm,
  width: 210mm,
)

#let cover-page-margins = (
  top: 3 * tum-logo-height,
  bottom: tum-logo-height,
  left: tum-logo-height,
  right: tum-logo-height,
)

#let title-page-margins = (
  top: 3 * tum-logo-height,
  bottom: 2 * tum-logo-height,
  left: 2 * tum-logo-height,
  right: 2 * tum-logo-height,
)

#let content-page-margins = (
  top: 3 * tum-logo-height,
  bottom: 2 * tum-logo-height,
  left: 2 * tum-logo-height,
  right: 2 * tum-logo-height,
)

#let first-line-indent = 1em

// ----- Heading styles -----
#show heading.where(level: 1): it => {
  set text(font: tum-font, size: font-sizes.h1, fill: TUMBlue)
  strong(it)
}
#show heading.where(level: 2): it => {
  set text(font: tum-font, size: font-sizes.h2, fill: TUMBlue)
  strong(it)
}
#show heading.where(level: 3): it => {
  set text(font: tum-font, size: font-sizes.h3)
  strong(it)
}
#show heading.where(level: 4): it => {
  set text(font: tum-font, size: font-sizes.h4)
  strong(it)
}
