#let check-keys(error-preamble, expected-keys, dict) = {
  for key in expected-keys [
    #if key not in dict {
      let error-msg = "[" + error-preamble + "] Missing required key: " + key
      panic(error-msg)
    }
  ]
}
