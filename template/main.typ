#import "../src/tum-tastic-thesis.typ": dissertation

// Import here each chapter
#import "chapters/theory.typ" as theory
#import "chapters/introduction.typ" as introduction

// We configure the template
#show: dissertation.with()

// Your chapters go here
#introduction.content

#pagebreak()
#theory.content

// Print bibliography
#pagebreak()
#bibliography("/bibliography.bib")