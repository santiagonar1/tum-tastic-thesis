#import "../src/tum-tastic-thesis.typ": chapter, print-bibliography

#let insert-par(num-par) = {
  while num-par > 0 {
    par()[#lorem(120)]
    num-par = num-par - 1
  }
}

// Handle undefined references when compiling a chapter as a standalone document
// You need to insert this at the beginning of each independent chapter
#show ref: it => {
  if it.element == none {
    text(fill: red)[(??)]
  } else {
    it
  }
}

#let content = [
  = Theory <ch:theory>
  This Chapter is provided in a separate file. This is quite interesting, as our
  *tum-tastic-thesis* provides the `chapter` template to allow compiling
  chapters both as a standalone document, or as part of the whole thesis. An
  issue that might occur when compiling this as a standalone document is that
  some references will not be present. For example, if you compile this with the
  thesis, the following reference will work: @ch:intro. If you are compiling
  this as a separate document, that will display "#text(fill: red)[(??)]"
  instead.

  Sadly, this also affects for now the bibliography. The following citations
  work when all the document is compiled, but fail when you compile this as a
  standalone document: @lamport1994latex @knuth1990literate.

  All other things should work as expected. We can have equations (see
  @eq:theory), figures (see @fig:theory), and tables (see @tab:theory).

  $ a^2 + b^2 = c^2 $ <eq:theory>


  #figure(
    ellipse(width: 35%, height: 50pt),
    caption: [Just an ellipse],
  ) <fig:theory>


  #figure(
    table(columns: 2)[A][B][C][D],
    caption: [I'm up here],
  ) <tab:theory>


  == A theory in detail
  #insert-par(4)

  == Another section of theory
  #insert-par(3)

  === This one has a subsubsection
  #insert-par(2)

  === And another subsubsection
  #insert-par(4)
]

#show: chapter.with(show-index: true)

#content
