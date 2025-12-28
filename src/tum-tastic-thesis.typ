#import "cover-page.typ": print-cover
#import "title-page.typ": print-dissertation-title
#import "abstract-page.typ": print-abstract
#import "acknowledgements-page.typ": print-acknowledgements
#import "tum-font.typ": font-sizes, tum-font
#import "page-conf.typ": first-line-indent
#import "content-page.typ": print-index

#let chapter(doc) = {
  // ----------- Sets -----------
  set text(font: tum-font, size: font-sizes.base)

  set par(justify: true, first-line-indent: first-line-indent)

  set heading(numbering: "1.1")

  show heading.where(level: 1): it => {
    set text(font: tum-font, size: font-sizes.h1)
    v(2em)
    strong(it)
    v(0.5em)
  }

  show heading.where(level: 2): it => {
    set text(font: tum-font, size: font-sizes.h2)
    strong(it)
    v(0.4em)
  }

  show heading.where(level: 3): it => {
    set text(font: tum-font, size: font-sizes.h3)
    strong(it)
    v(0.2em)
  }

  show heading.where(level: 4): it => {
    set text(font: tum-font, size: font-sizes.h4)
    strong(it)
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
  doc,
) = {
  let print-empty-page() = [
    #pagebreak()
    #pagebreak()
  ]

  // ----------- Sets -----------
  set document(title: title, author: author-info.name, date: datetime.today())

  // ----------- Preamble -----------
  print-cover(author-info: author-info, title: title, subtitle: subtitle)
  print-empty-page()

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

  print-acknowledgements(acknowledgements)
  print-empty-page()

  print-abstract(abstract)
  pagebreak()

  print-index()
  pagebreak()

  // ----------- Chapters -----------
  show: chapter.with()

  doc
}
