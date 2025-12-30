// ************* PASTE THIS ON EVERY STANDALONE DOCUMENT ***********************

#import "../../src/tum-tastic-thesis.typ": chapter
#import "../../src/tum-tastic-thesis.typ": flex-caption
#import "../../src/tum-tastic-thesis.typ": listing
#import "../../src/tum-tastic-thesis.typ": algorithm, d, i
#import "@preview/abbr:0.3.0"

// Handle undefined references when compiling a chapter as a standalone
// document. See:
//  - https://github.com/typst/typst/issues/4524#issuecomment-2221803060
//  - https://github.com/typst/typst/issues/1276#issuecomment-1560091418
#show ref: it => {
  if it.element == none {
    text(fill: red)[(??)]
  } else {
    it
  }
}

#show: abbr.show-rule
#abbr.load("../abbreviations.csv")

#show: chapter.with(
  show-index: true,
  show-figures-index: true,
  show-table-index: true,
  show-listing-index: true,
  show-algorithm-index: true,
)

// ************************ PASTE UNTIL HERE *********************************

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
  @knuth1990literate @lamport1994latex. We can also have smart abbreviations,
  like @PDE and @PDE.

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

  === With listing function

  #listing(
    code: ```typst
    #show ref: it => {
      if it.element == none {
        text(fill: red)[(??)]
      } else {
        it
      }
    }
    ```,
    caption: [Code snippet using listing function],
  )

  === Passing raw to a figure

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
    caption: [Code snippet using figure function],
  )

  == An algorithm

  #algorithm(
    title: "Fib",
    parameters: ("n",),
    code: [
      if $n < 0$:#i\ // use #i to indent the following lines
      return null#d\ // use #d to dedent the following lines
      if $n = 0$ or $n = 1$:#i \
      return $n$#d \
      return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
    ],
    caption: [My algorithm],
  )

]

#content
