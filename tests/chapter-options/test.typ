#import "/src/tum-tastic-thesis.typ": chapter

#import "@preview/algo:0.3.6" as algo

#let show-index = [
  #show: chapter.with(show-index: true)
]

#let show-algorithm-index = [
  #show: chapter.with(show-algorithm-index: true)
  = Algorithms
]

#let show-figures-index = [
  #show: chapter.with(show-figures-index: true)
  = Figures
]

#let show-table-index = [
  #show: chapter.with(show-table-index: true)
  = Tables
]

#let show-listing-index = [
  #show: chapter.with(show-listing-index: true)
  = Listing
]

#show-index
#show-algorithm-index
#show-figures-index
#show-table-index
#show-listing-index