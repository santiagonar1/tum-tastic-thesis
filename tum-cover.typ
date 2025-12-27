#import "tum-user.typ": check-author-info
#import "tum-colors.typ": tum-colors
#import "tum-font.typ": font-sizes, tum-font
#import "tum-page.typ": tum-page
#import "tum-header.typ": three-liner-headline-with-logo, tum-logo-height

#let print-cover(author-info, title, subtitle: none) = [
  #check-author-info(author-info)

  #set text(font: tum-font)

  #let margins = (
    top: 3 * tum-logo-height,
    bottom: tum-logo-height,
    left: tum-logo-height,
    right: tum-logo-height,
  )

  #set page(
    paper: tum-page.type,
    header: three-liner-headline-with-logo(author-info),
    margin: margins,
  )

  #let make_title = (my-title, subtitle: none) => [
    #v(tum-logo-height)
    #text(size: font-sizes.h1, weight: "bold")[
      #align(left)[#my-title]
    ]

    #v(0.8em)
    #if subtitle != none {
      set text(size: font-sizes.h2)
      subtitle
    }
    #v(6em)
    #text(
      size: font-sizes.h2,
      fill: tum-colors.blue,
      weight: "bold",
    )[#author-info.name]
  ]

  #make_title(title, subtitle: subtitle)

  #let content-height = tum-page.height - margins.top - margins.bottom
  #let content-width = tum-page.width - margins.left - margins.right
  #let half-page = 0.5 * content-height

  #let tum-cover-image() = align(right)[
    #image("assets/TUM_Tower.svg", width: 0.6 * content-width)
  ]

  #place(top + left, dx: 0pt, dy: content-height / 2, box(
    height: half-page,
    width: content-width,
  )[
    #place(bottom + right, tum-cover-image())
  ])
]

#let my-info = (
  name: "Santiago Narváez Rivas",
  group-name: "Chair of Scientific Computing",
  school-name: "TUM School of Computation, Information and Technology",
)

#let dissertation-title = "Evaluation of Elastic Applications in HPC"
#let dissertation-subtitle = "Subtitle of the thesis"

#print-cover(my-info, dissertation-title, subtitle: dissertation-subtitle)

#print-cover(my-info, dissertation-title)
