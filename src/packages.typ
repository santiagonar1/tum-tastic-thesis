#let package(name) = {
  let packages = (
    algo: "0.3.6",
  )

  let version = packages.at(name)

  "@preview/" + name + ":" + version
}
