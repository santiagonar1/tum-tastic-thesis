#let tum-page = (
  type: "a4",
  height: 297mm,
  width: 210mm,
)

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
