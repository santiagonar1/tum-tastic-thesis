#import "/src/cover-page.typ": print-cover

#let cover-image = image("assets/TUM_Tower.svg")
#print-cover(
  cover-image: cover-image,
  subtitle: [The subtitle of your work],
  title: [Your Amazing Title Goes Here],
)
