#import "src/tum-tastic-thesis.typ": dissertation

#import "chapters/theory.typ" as theory

#show: dissertation.with(bib-sources: "/bibliography.bib")

// ----------- Chapters -----------
= Introduction <ch:intro>
Here is an example of a citation @lamport1994latex. One can also have multiple
citations @lamport1994latex @knuth1990literate. You can also mention things like
@fig:curve, @tab:table, or @eq:equation.

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

The remaining sections in this Chapter, such as @ch:intro:section, just have
gibberish. Although @ch:intro was written directly in the `main.typ` file,
@ch:theory is provided in a separate file. Check both the PDF and the code to
see some interesting facts about this.

#figure(
  table(columns: 2)[A][B][C][D],
  caption: [I'm up here],
) <tab:table>

#lorem(40)

$ a^2 + b^2 = c^2 $ <eq:equation>

== A section <ch:intro:section>
#lorem(120)

#lorem(120)

=== Another section
#lorem(120)

#lorem(120)

==== Yet another section
#lorem(20)

#pagebreak()
#theory.content
