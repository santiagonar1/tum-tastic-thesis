#import "/src/tum-tastic-thesis.typ": thesis

#import "@preview/algo:0.3.6" as algo

#let show-cover = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-cover-with-image = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    cover-image: rect(fill: blue),
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-abstract = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: [Here is my custom abstract],
  )
]

#let show-acknowledgements = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: [Here are my custom acknowledgements],
    abstract: none,
  )
]

#let show-index = [
  #show: thesis.with(
    show-index: true,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Figures
]

#let show-algorithm-index = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: true,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Algorithms
]

#let show-figures-index = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: true,
    show-cover: false,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Figures
]

#let show-table-index = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: true,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Tables
]

#let show-listing-index = [
  #show: thesis.with(
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: false,
    show-table-index: false,
    show-listing-index: true,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
  = Listing
]

#let show-custom-title = [
  #show: thesis.with(
    title: [Custom title],
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-subtitle = [
  #show: thesis.with(
    subtitle: [Custom subtitle],
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-author-info = [
  #show: thesis.with(
    author-info: (
      name: "Custom Name",
      group-name: "Custom Group Name",
      school-name: "Custom School Name",
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-chair-info = [
  #show: thesis.with(
    committee-info: (
      examiner: "Prof. Custom Here",
      supervisor: "Custom supervisor goes here",
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-dates = [
  #show: thesis.with(
    date-submitted: datetime(
      year: 1800,
      month: 10,
      day: 4,
    ),
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#let show-custom-degree-name = [
  #show: thesis.with(
    degree-name: "My Custom Degree",
    show-index: false,
    show-algorithm-index: false,
    show-figures-index: false,
    show-cover: true,
    show-table-index: false,
    show-listing-index: false,
    show-chapter-header: false,
    acknowledgements: none,
    abstract: none,
  )
]

#show-cover
#show-cover-with-image
#show-index
#show-abstract
#show-acknowledgements
#show-algorithm-index
#show-figures-index
#show-table-index
#show-listing-index
#show-custom-title
#show-custom-subtitle
#show-custom-author-info
#show-custom-chair-info
#show-custom-dates
