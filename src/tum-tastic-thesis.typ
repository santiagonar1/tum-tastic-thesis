#import "cover-page.typ": print-cover
#import "title-page.typ": print-dissertation-title
#import "abstract-page.typ": print-abstract
#import "acknowledgements-page.typ": print-acknowledgements
#import "tum-font.typ": font-sizes, tum-font
#import "page-conf.typ": first-line-indent
#import "content-page.typ": print-index
#import "bibliography-page.typ": print-bibliography

#let chapter(show-index: false, doc) = {
  // ----------- Sets -----------
  // Format page count
  counter(page).update(1)
  set page(numbering: "1")

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
    // For each chapter we need to reset the equation, figure.
    counter(math.equation).update(0)
    counter(figure.where(kind: image)).update(0)
    counter(figure.where(kind: table)).update(0)

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

  if show-index {
    print-index()
    pagebreak()
  }

  doc
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
  bib-sources: "/bibliography.bib",
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
    print-cover(author-info: author-info, title: title, subtitle: subtitle)
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

  // ----------- Chapters -----------
  show: chapter.with()

  doc

  pagebreak()
  print-bibliography(bib-sources)
}
