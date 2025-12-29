#import "../../src/tum-tastic-thesis.typ": chapter, flex-caption

// Handle undefined references when compiling a chapter as a standalone document
// You need to insert this at the beginning of each independent chapter. See
//  - https://github.com/typst/typst/issues/4524#issuecomment-2221803060
//  - https://github.com/typst/typst/issues/1276#issuecomment-1560091418
#show ref: it => {
  if it.element == none {
    text(fill: red)[(??)]
  } else {
    it
  }
}

#show: chapter.with(
  show-index: true,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
)

// Only here to generate random paragraphs of text
#let insert-par(num-par) = {
  while num-par > 0 {
    par()[#lorem(120)]
    num-par = num-par - 1
  }
}

#let content = [
  = Introduction <ch:introduction>
  Check references style: @ch:introduction, @intro:sec:first and
  @intro:sec:second. Also @intro:subsec:first and @intro:subsec:second.
  Bibliography does not work when compiling a standalone chapter:
  @knuth1990literate @lamport1994latex

  #insert-par(3)

  == First subsection introduction <intro:sec:first>
  #insert-par(4)

  === A subsubsection <intro:subsec:first>
  #insert-par(4)

  === Another subsubsection <intro:subsec:second>
  #insert-par(2)

  == A figure <intro:sec:second>

  === With normal caption
  #figure(
    ellipse(width: 35%, height: 50pt),
    caption: [Just an ellipse],
  )

  === With flex-caption
  Our flex-caption is based on #link(
    "https://github.com/typst/typst/issues/1295#issuecomment-2749005636",
  )[the solution proposed by q-wertz].

  // See: https://github.com/typst/typst/issues/1295#issuecomment-2749005636
  #figure(
    curve(
      fill: blue.lighten(80%),
      stroke: blue,
      curve.move((0pt, 50pt)),
      curve.line((100pt, 50pt)),
      curve.cubic(none, (90pt, 0pt), (50pt, 0pt)),
      curve.close(),
    ),
    caption: flex-caption(
      short: [Short caption for outline],
      long: [This is a really long caption, so a brief version should be
        displayed in the *List of Figures*. You can use it for anything that
        takes a caption],
    ),
  )

  == A table

  #figure(
    table(columns: 2)[A][B][C][D],
    caption: [Amazing table],
  )

  == Code snippet

  #figure(
    ```typst
    #show ref: it => {
      if it.element == none {
        text(fill: red)[(??)]
      } else {
        it
      }
    }
    ```,
    caption: [Amazing code snippet],
  )

]

#content
