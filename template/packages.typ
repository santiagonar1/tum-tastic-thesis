#let package(name) = {
  let packages = (
    abbr: "0.3.0",
  )

  let version = packages.at(name)

  "@preview/" + name + ":" + version
}
