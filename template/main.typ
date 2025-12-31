#import "@preview/tum-tastic-thesis:0.1.0": dissertation, thesis

#import "packages.typ": package

#import package("abbr") as abbr

#show: abbr.show-rule
#abbr.load("abbreviations.csv")

// Import each chapter here
#import "theory.typ" as theory
#import "introduction.typ" as introduction

// We configure the template
#show: dissertation.with()

// If you are doing a bachelor/master thesis, use instead:
// #show: thesis.with()

// Your chapters go here
#introduction.content

#pagebreak()
#theory.content


#set heading(numbering: none)

// Print bibliography
#pagebreak()
#bibliography("bibliography.bib")

// Print abbreviations
#pagebreak()
#abbr.list()
