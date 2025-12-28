#import "../src/tum-tastic-thesis.typ": chapter

#let insert-par(num-par) = {
  while num-par > 0 {
    par()[#lorem(120)]
    num-par = num-par - 1
  }
}

#let content = [
  = Theory <ch:theory>
  Here is an example of a citation @lamport1994latex. One can also have multiple
  citations @lamport1994latex @knuth1990literate. @eq:theory shows a link to an
  equation.

  $ a^2 + b^2 = c^2 $ <eq:theory>

  You can also insert figures here, as in @fig:curve.

  #figure(
    ellipse(width: 35%, height: 50pt),
    caption: [Just an ellipse],
  ) <fig:theory>

  And of course also a table, as in @tab:theory.

  #figure(
    table(columns: 2)[A][B][C][D],
    caption: [I'm up here],
  ) <tab:theory>

  #insert-par(2)

  == A theory in detail
  #insert-par(4)

  == Another section of theory
  #insert-par(3)

  === This one has a subsubsection
  #insert-par(2)

  === And another subsubsection
  #insert-par(4)
]

#show: chapter.with(show-index: true, bib-sources: "/bibliography.bib")

#content
