#import "/src/tum-tastic-thesis.typ": (
  algorithm, d, thesis, flex-caption, i, listing,
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

=== With listing function

#listing(
  code: ```typst
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

=== Passing raw to a figure

#figure(
  ```typst
  #show ref: it => {
    if it.element == none {
      text(fill: red)[(??)]
    } else {
      it
    }
  }
  ```,
  caption: [Code snippet using figure function],
)

== An algorithm

#algorithm(
  title: "Fib",
  parameters: ("n",),
  code: [
    if $n < 0$:#i\ // use #i to indent the following lines
    return null#d\ // use #d to dedent the following lines
    if $n = 0$ or $n = 1$:#i \
    return $n$#d \
    return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
  ],
  caption: [My algorithm],
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
  code: ```typst
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

=== Passing raw to a figure

#figure(
  ```typst
  #show ref: it => {
    if it.element == none {
      text(fill: red)[(??)]
    } else {
      it
    }
  }
  ```,
  caption: [Code snippet using figure function],
)

== An algorithm

#algorithm(
  title: "Fib",
  parameters: ("n",),
  code: [
    if $n < 0$:#i\ // use #i to indent the following lines
    return null#d\ // use #d to dedent the following lines
    if $n = 0$ or $n = 1$:#i \
    return $n$#d \
    return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
  ],
  caption: [My algorithm],
)
