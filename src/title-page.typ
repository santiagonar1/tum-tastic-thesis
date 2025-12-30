#import "tum-header.typ": tum-logo-height, two-liner-headline-with-logo
#import "page-conf.typ": title-page-margins, tum-page
#import "tum-font.typ": font-sizes, tum-font
#import "tum-colors.typ": tum-colors
#import "university-names.typ": tum-name
#import "committee-information.typ": check-committee-info
#import "author-info.typ": check-author-info

#let print-dissertation-title(
  author-info: (
    name: "Your Name Here",
    group-name: "Your Group Or Chair Here",
    school-name: "Your School Here",
  ),
  dissertation-title: [Your Title Here],
  subtitle: none,
  degree-name: "Dr. In Something",
  committee-info: (
    chair: "Prof. Chair Here",
    first-evaluator: "Prof. First Evaluator Here",
    second-evaluator: "Prof. Second Evaluator Here",
  ),
  date-submitted: datetime.today(),
  date-accepted: datetime.today(),
) = [
  // -------------- Checks --------------
  #check-author-info(author-info)
  #check-committee-info(committee-info)

  #if date-submitted > date-accepted [
    #let error-msg = (
      "[print-dissertation-cover] Date submitted (which is "
        + date-submitted.display()
        + ") cannot be after date accepted (which is "
        + date-accepted.display()
        + ")"
    )
    #panic(error-msg)
  ]

  // --------------  Sets  --------------
  #set text(font: tum-font)

  #let margins = title-page-margins
  #set page(
    paper: tum-page.type,
    margin: margins,
  )

  // -------------- Content --------------
  #two-liner-headline-with-logo(author-info, top + left)

  #let make_title = (my-title, subtitle: none) => [
    #show title: set text(size: font-sizes.h1)
    #show title: set align(left)
    #v(tum-logo-height)
    #title[#my-title]

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

  #make_title(dissertation-title, subtitle: subtitle)

  #let content-height = tum-page.height - margins.top - margins.bottom
  #let content-width = tum-page.width - margins.left - margins.right
  #let half-page = 0.5 * content-height

  #let fine-print-block = [
    Vollständiger Abdruck der von der TUM School of Computation, Information and
    Technology der #tum-name.dative zur Erlangung des akademischen Grades eines
    #v(1.2em)
    *#degree-name*
    #v(1.2em)
    genehmigten Dissertation.
  ]

  #let committee-block = [
    *Vorsitz*\
    #committee-info.chair
    #v(0.6em)
    *Prüfer\*innen der Dissertation:*
    + #committee-info.first-evaluator
    + #committee-info.second-evaluator
  ]

  #let submission-block = [
    Die Dissertation wurde am #date-submitted.display("[day].[month].[year]")
    bei der #tum-name.dative eingereicht und durch die #author-info.school-name
    am #date-accepted.display("[day].[month].[year]") angenommen.
  ]

  #place(top + left, dx: 0pt, dy: content-height / 2)[
    #set text(size: font-sizes.base)

    #let first-box-height = half-page / 2 - tum-logo-height

    #box(
      height: first-box-height,
      width: content-width,
    )[
      #fine-print-block
    ]

    #box(
      height: half-page / 2,
      width: content-width,
    )[
      #committee-block
      #v(4em)
      #submission-block
    ]
  ]
]


#let author-info = (
  name: "Santiago Narváez Rivas",
  group-name: "Chair of Scientific Computing",
  school-name: "TUM School of Computation, Information and Technology",
)

#let committee-info = (
  chair: "Prof. Chair Goes Here",
  first-evaluator: "Prof. First Evaluator Here",
  second-evaluator: "Prof. Second Evaluator Here",
)

#print-dissertation-title()
