#import "src/tum-tastic-thesis.typ": dissertation

#import "chapters/theory.typ" as chapter

#show: dissertation.with(bib-sources: "/bibliography.bib")

// ----------- Chapters -----------
= Introduction
Here is an example of a citation @lamport1994latex. One can also have multiple
citations @lamport1994latex @knuth1990literate. You can also mention things like @fig:curve, @tab:table, or @eq:equation.

#figure(
  curve(
    fill: blue.lighten(80%),
    stroke: blue,
    curve.move((0pt, 50pt)),
    curve.line((100pt, 50pt)),
    curve.cubic(none, (90pt, 0pt), (50pt, 0pt)),
    curve.close(),
  ),
  caption: [Just a curve],
) <fig:curve>

#lorem(40)

#figure(
  table(columns: 2)[A][B][C][D],
  caption: [I'm up here],
) <tab:table>

#lorem(40)

$ a^2 + b^2 = c^2 $ <eq:equation>



== A section
#lorem(120)

#lorem(120)

=== Another section
#lorem(120)

#lorem(120)

==== Yet another section
#lorem(20)

#pagebreak()
#chapter.content
