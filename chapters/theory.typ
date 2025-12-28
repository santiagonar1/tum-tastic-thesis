#import "../src/tum-tastic-thesis.typ":chapter

#let insert-par(num-par) = {
  while num-par > 0 {
    par()[#lorem(120)]
    num-par = num-par - 1
  }
}

#let content = [
  = Theory
  #insert-par(2)

  == A theory in detail
  #insert-par(4)

  == Another section of theory
  #insert-par(3)

  === This one has a subsubsection
  #insert-par(2)

  === And another subsubsection
  #insert-par(4)
]

#show: chapter.with()

#content
