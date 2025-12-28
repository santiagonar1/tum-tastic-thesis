#import "src/tum-tastic-thesis.typ": dissertation

#import "chapters/theory.typ" as chapter

#show: dissertation.with(bib-sources: "/bibliography.bib")

// ----------- Chapters -----------
= Introduction
Here is an example of a citation @lamport1994latex. One can also have multiple
citations @lamport1994latex @knuth1990literate.

#lorem(120)

#lorem(12)

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
