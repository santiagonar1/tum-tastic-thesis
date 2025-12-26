#import "@preview/cetz:0.4.2"

#import "tum-colors.typ": tum-blue

#set page(
  paper: "a4",
  margin: (x: 1.8cm, y: 1.5cm),
)

// for width ratio, see pts in tum-logo-canvas: ratio = max-x / max-y = 1.89
// #let draw-tum-logo(height: 10mm) = diagram(tum-logo-canvas, height, 1.9)

#let draw-tum-logo(height, origin: bottom + left) = {
  let diagram(canvas, width-ratio) = {
    let scaled = context {
      let canvas-size = measure(canvas)
      let factor = height / canvas-size.height * 100%
      scale(origin: origin, factor, canvas)
    }

    box(
      height: height,
      width: height * width-ratio,
    )[ #scaled ]
  }

  let tum-logo-canvas = cetz.canvas({
    import cetz.draw: *
    let pts = (
      (0, 39),
      (0, 32),
      (7, 32),
      (7, 0),
      (14, 0),
      (14, 32),
      (22, 32),
      (22, 0),
      (44, 0),
      (44, 32),
      (52, 32),
      (52, 0),
      (59, 0),
      (59, 32),
      (67, 32),
      (67, 0),
      (74, 0),
      (74, 39),
      (37, 39),
      (37, 7),
      (29, 7),
      (29, 39),
    )

    line(..pts, fill: tum-blue)
  })

  diagram(tum-logo-canvas, 1.9)
}

#grid(
  columns: 3,
  stroke: 1pt,
  gutter: 5pt,
  draw-tum-logo(10mm), draw-tum-logo(20mm), draw-tum-logo(40mm),
)

#v(12pt)

#grid(
  rows: 3,
  stroke: 1pt,
  gutter: 5pt,
  draw-tum-logo(10mm),
  draw-tum-logo(20mm),
  draw-tum-logo(40mm),
)

