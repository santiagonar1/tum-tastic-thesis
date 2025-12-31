#import "/src/tum-tastic-thesis.typ": (
  algorithm, d, flex-caption, i, listing, thesis,
)

#show: thesis.with()


// Your chapters go here
= introduction <ch:introduction>
Check references style: @ch:introduction, @intro:sec:first and
@intro:sec:second. Also @intro:subsec:first and @intro:subsec:second.
Bibliography does not work when compiling a standalone chapter


== First subsection introduction <intro:sec:first>

=== A subsubsection <intro:subsec:first>

=== Another subsubsection <intro:subsec:second>

== A figure <intro:sec:second>

=== With normal caption
#figure(
  ellipse(width: 35%, height: 50pt),
  caption: [Just an ellipse],
)

=== With flex-caption
Our flex-caption is based on #link(
  "https://github.com/typst/typst/issues/1295#issuecomment-2749005636",
)[the solution proposed by q-wertz].

#figure(
  curve(
    fill: blue.lighten(80%),
    stroke: blue,
    curve.move((0pt, 50pt)),
    curve.line((100pt, 50pt)),
    curve.cubic(none, (90pt, 0pt), (50pt, 0pt)),
    curve.close(),
  ),
  caption: flex-caption(
    short: [Short caption for outline],
    long: [This is a really long caption, so a brief version should be displayed
      in the *List of Figures*. You can use it for anything that takes a
      caption],
  ),
)

== A table

#figure(
  table(columns: 2)[A][B][C][D],
  caption: [Amazing table],
)

== Code snippet

#listing(
  my-code: ```typst
  #show ref: it => {
    if it.element == none {
      text(fill: red)[(??)]
    } else {
      it
    }
  }
  ```,
  caption: [Code snippet using listing function],
)

== An algorithm

=== With algorithm function

#algorithm(
  title: "Fib",
  parameters: ("n",),
  my-content: [
    if $n < 0$:#i\ // use #i to indent the following lines
    return null#d\ // use #d to dedent the following lines
    if $n = 0$ or $n = 1$:#i \
    return $n$#d \
    return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
  ],
  caption: [My algorithm],
)

=== Passing alg to a figure

#import "@preview/algo:0.3.6": algo, d, i

#let my-content = [
  if $n < 0$:#i\ // use #i to indent the following lines
  return null#d\ // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i \
  return $n$#d \
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
]

#figure(
  algo(
    title: "Fib",
    parameters: ("n",),
    fill: rgb("#e4c554"),
    my-content,
  ),
  caption: [my caption],
  kind: "algorithm",
  supplement: [Algorithm],
)


#pagebreak()

= Theory <ch:theory>
Check references style: @ch:theory, @theory:sec:first and @theory:sec:second.
Also @theory:subsec:first and @theory:subsec:second.

== First subsection theory <theory:sec:first>

=== A subsubsection <theory:subsec:first>

=== Another subsubsection <theory:subsec:second>

== A figure <theory:sec:second>

=== With normal caption
#figure(
  ellipse(width: 35%, height: 50pt),
  caption: [Just an ellipse],
)

=== With flex-caption
Our flex-caption is based on #link(
  "https://github.com/typst/typst/issues/1295#issuecomment-2749005636",
)[the solution proposed by q-wertz].

// See: https://github.com/typst/typst/issues/1295#issuecomment-2749005636
#figure(
  curve(
    fill: blue.lighten(80%),
    stroke: blue,
    curve.move((0pt, 50pt)),
    curve.line((100pt, 50pt)),
    curve.cubic(none, (90pt, 0pt), (50pt, 0pt)),
    curve.close(),
  ),
  caption: flex-caption(
    short: [Short caption for outline],
    long: [This is a really long caption, so a brief version should be displayed
      in the *List of Figures*. You can use it for anything that takes a
      caption],
  ),
)

== A table

#figure(
  table(columns: 2)[A][B][C][D],
  caption: [Amazing table],
)

== Code snippet

=== With listing function

#listing(
  my-code: ```typst
  #show ref: it => {
    if it.element == none {
      text(fill: red)[(??)]
    } else {
      it
    }
  }
  ```,
  caption: [Code snippet using listing function],
)

=== Passing code to a figure

#import "@preview/algo:0.3.6": code

#let my-code = ```typst
#show ref: it => {
  if it.element == none {
    text(fill: red)[(??)]
  } else {
    it
  }
}
```
#figure(code(my-code, fill: luma(61.15%)), caption: [my caption], kind: raw)

== An algorithm

=== With algorithm function

#algorithm(
  title: "Fib",
  parameters: ("n",),
  my-content: [
    if $n < 0$:#i\ // use #i to indent the following lines
    return null#d\ // use #d to dedent the following lines
    if $n = 0$ or $n = 1$:#i \
    return $n$#d \
    return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
  ],
  caption: [My algorithm],
)

=== Passing alg to a figure

#import "@preview/algo:0.3.6": algo, d, i

#let my-content = [
  if $n < 0$:#i\ // use #i to indent the following lines
  return null#d\ // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i \
  return $n$#d \
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
]

#figure(
  algo(
    title: "Fib",
    parameters: ("n",),
    fill: rgb("#e4c554"),
    my-content,
  ),
  caption: [my caption],
  kind: "algorithm",
  supplement: [Algorithm],
)
