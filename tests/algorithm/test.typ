#import "/src/tum-tastic-thesis.typ": algorithm, d, i

#let my-content = [
  if $n < 0$:#i\ // use #i to indent the following lines
  return null#d\ // use #d to dedent the following lines
  if $n = 0$ or $n = 1$:#i \
  return $n$#d \
  return #smallcaps("Fib")$(n-1) +$ #smallcaps("Fib")$(n-2)$/*  */
]

See @my-algorithm

#algorithm(
  title: "Fib",
  parameters: ("n",),
  my-content: my-content,
  caption: [My algorithm],
) <my-algorithm>

#algorithm(
  title: "Fib",
  parameters: ("n",),
  my-content: my-content,
  caption: [My algorithm with other filling],
  fill: rgb("#e4c554"),
)

