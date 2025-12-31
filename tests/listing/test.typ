#import "/src/tum-tastic-thesis.typ": listing

#let my-code = ```typst
#show ref: it => {
  if it.element == none {
    text(fill: red)[(??)]
  } else {
    it
  }
}
```

#listing(
  my-code: my-code,
  caption: [Code snippet using listing function],
)

#listing(
  my-code: my-code,
  fill: luma(61.15%), // Default value
  caption: [Other with different fill],
)
