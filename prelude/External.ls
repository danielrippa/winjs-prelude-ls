
  do ->

    { Str } = dependency 'primitive.Type'

    { load-script, load-library, load-wasm } = winjs

    library = -> load-library Str it

    script = -> load-script Str it

    wasm = -> load-wasm Str it

    {
      library, script, wasm
    }