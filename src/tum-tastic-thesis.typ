#import "cover-page.typ": print-cover
#import "title-page.typ": print-dissertation-title
#import "abstract-page.typ": print-abstract
#import "acknowledgements-page.typ": print-acknowledgements
#import "tum-font.typ": font-sizes, tum-font
#import "page-conf.typ": first-line-indent
#import "content-page.typ": *
#import "tum-colors.typ": tum-colors

#import "packages.typ": package
#import package("algo"): algo, d, i

// ************************ FUNCTIONS *************************

#let listing(
  code: raw("code"),
  caption: [my caption],
) = [
  #figure(code, caption: caption)
]

#let algorithm(
  title: "My algorithm",
  parameters: (),
  code: [],
  caption: [my caption],
) = [
  #figure(
    algo(
      title: title,
      parameters: parameters,
      fill: rgb(255, 244, 204),
      code,
    ),
    caption: caption,
    supplement: [Algorithm],
    kind: "algorithm",
  )
]

// Nice function to enable short and longer descriptions of figures.
// The short one will be displayed in the outline, the long one in
// the figure caption.
//
// Taken from:
//  - https://github.com/typst/typst/issues/1295#issuecomment-2749005636
#let flex-caption(short: none, long: none) = context if state(
  "in-outline",
  false,
).get() {
  short
} else { long }

// ************************ TEMPLATES *************************

#let chapter(
  show-index: false,
  show-figures-index: false,
  show-table-index: false,
  show-listing-index: false,
  show-algorithm-index: false,
  doc,
) = {
  // ----------- Sets -----------
  // Format page count
  counter(page).update(1)
  set page(numbering: "1")

  // Format link
  show link: it => {
    // Only color blue for str, which usually are links
    if type(it.dest) == str {
      text(fill: tum-colors.blue)[#it.body]
    } else {
      it.body
    }
  }

  // Format raw text, used for code blocks
  show raw.where(block: true): it => {
    set block(inset: 5pt, fill: luma(240))
    pad(0.5em, it)
  }

  // Format equation counting as (chapter.#eq)
  set math.equation(
    numbering: it => {
      let count = counter(heading.where(level: 1)).at(here()).first()
      if count > 0 {
        numbering("(1.1)", count, it)
      } else {
        numbering("(1)", it)
      }
    },
  )

  // Format figure caption
  show figure.caption: it => [
    #text(weight: "bold")[
      #it.supplement
      #it.counter.display(it.numbering)
    ]
    #it.body
  ]

  // Format figure counting as chapter.#fig
  set figure(numbering: it => {
    let count = counter(heading.where(level: 1)).at(here()).first()
    if count > 0 {
      numbering("1.1", count, it)
    } else {
      numbering("1", it)
    }
  })

  // Call level 1 headings Chapter instead of Section
  show heading.where(level: 1): set heading(supplement: [Chapter])

  set figure(gap: 1em)

  set text(font: tum-font, size: font-sizes.base)

  set par(justify: true, first-line-indent: first-line-indent)

  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    // For each chapter we need to reset these counters:.
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)
    counter(figure.where(kind: raw)).update(0)
    counter(figure.where(kind: "algorithm")).update(0)

    set text(font: tum-font, size: font-sizes.h1)
    v(2em)
    strong(it)
    v(1em)
  }

  show heading.where(level: 2): it => {
    set text(font: tum-font, size: font-sizes.h2)
    v(0.2em)
    strong(it)
    v(0.6em)
  }

  show heading.where(level: 3): it => {
    set text(font: tum-font, size: font-sizes.h3)
    strong(it)
    v(0.3em)
  }

  show heading.where(level: 4): it => {
    set text(font: tum-font, size: font-sizes.h4)
    strong(it)
  }

  // ----------- Preamble -----------
  if show-index {
    print-index()
    pagebreak()
  }

  // ----------- Content -----------
  doc

  // --------After content ---------

  // Note: it is important for the pagebreak() to be before any printing,
  // as otherwise typst might think that the page belongs to whatever
  // previous section the doc had last
  if show-figures-index {
    pagebreak()
    print-figure-index()
  }

  if show-table-index {
    pagebreak()
    print-table-index()
  }

  if show-listing-index {
    pagebreak()
    print-listing-index()
  }

  if show-algorithm-index {
    pagebreak()
    print-algorithm-index()
  }
}

#let dissertation(
  author-info: (
    name: "Your Name Here",
    group-name: "Your Group Or Chair Here",
    school-name: "Your School Here",
  ),
  title: [Your Title Here],
  subtitle: none,
  degree-name: "Dr. In Something",
  committee-info: (
    chair: "Prof. Chair Here",
    first-evaluator: "Prof. First Evaluator Here",
    second-evaluator: "Prof. Second Evaluator Here",
  ),
  date-submitted: datetime.today(),
  date-accepted: datetime.today(),
  acknowledgements: [#lorem(100)],
  abstract: [#lorem(100)],
  show-cover: true,
  cover-image: none,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
  show-algorithm-index: true,
  doc,
) = {
  let print-empty-page() = [
    #pagebreak()
    #pagebreak()
  ]

  // ----------- Sets -----------
  set document(title: title, author: author-info.name, date: datetime.today())

  // ----------- Preamble -----------
  if show-cover {
    print-cover(
      author-info: author-info,
      title: title,
      subtitle: subtitle,
      cover-image: cover-image,
    )
    print-empty-page()
  }

  print-dissertation-title(
    author-info: author-info,
    dissertation-title: title,
    subtitle: subtitle,
    degree-name: degree-name,
    committee-info: committee-info,
    date-submitted: date-submitted,
    date-accepted: date-accepted,
  )
  print-empty-page()

  set page(numbering: "i")

  if acknowledgements != none {
    print-acknowledgements(acknowledgements)
    print-empty-page()
  }

  if abstract != none {
    print-abstract(abstract)
    pagebreak()
  }

  print-index()
  pagebreak()

  // ----------- Content -----------
  show: chapter.with()

  doc

  // --------- After Content -------
  if show-figures-index {
    pagebreak()
    print-figure-index()
  }

  if show-table-index {
    pagebreak()
    print-table-index()
  }

  if show-listing-index {
    pagebreak()
    print-listing-index()
  }

  if show-algorithm-index {
    pagebreak()
    print-algorithm-index()
  }
}
