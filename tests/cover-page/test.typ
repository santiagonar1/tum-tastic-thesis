#import "/src/cover-page.typ": *

#print-cover()
#print-cover(title: [A title test], subtitle: [A subtitle test])
#print-cover(title: [A title test])
#print-cover(
  title: [A title test],
  subtitle: [A subtitle],
  cover-image: image("/assets/TUM_Tower.svg"),
)
#print-cover(title: [A title test], cover-image: image("/assets/TUM_Tower.svg"))
