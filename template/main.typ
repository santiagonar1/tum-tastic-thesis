#import "../src/tum-tastic-thesis.typ": dissertation

#import "@preview/abbr:0.3.0"

#show: abbr.show-rule
#abbr.load("abbreviations.csv")

// Import here each chapter
#import "chapters/theory.typ" as theory
#import "chapters/introduction.typ" as introduction

// We configure the template
#show: dissertation.with()

// Your chapters go here
#introduction.content

#pagebreak()
#theory.content


#set heading(numbering: none)

// Print bibliography
#pagebreak()
#bibliography("bibliography.bib")

#pagebreak()
#abbr.list()
