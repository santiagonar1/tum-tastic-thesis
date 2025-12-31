#import "/src/tum-tastic-thesis.typ": chapter

#import "@preview/algo:0.3.6" as algo

#let show-index = [
  #show: chapter.with(show-index: true, show-chapter-header: false)
]

#let show-algorithm-index = [
  #show: chapter.with(show-algorithm-index: true, show-chapter-header: false)
  = Algorithms
]

#let show-figures-index = [
  #show: chapter.with(show-figures-index: true, show-chapter-header: false)
  = Figures
]

#let show-table-index = [
  #show: chapter.with(show-table-index: true, show-chapter-header: false)
  = Tables
]

#let show-listing-index = [
  #show: chapter.with(show-listing-index: true, show-chapter-header: false)
  = Listing
]

#let show-chapter-header = [
  #show: chapter.with()
  = One
  #pagebreak()
  == Inside one
  #pagebreak()
  = Two
  #pagebreak()
  == Inside two
]

#show-index
#show-algorithm-index
#show-figures-index
#show-table-index
#show-listing-index
#show-chapter-header
