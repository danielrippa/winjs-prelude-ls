
  do ->

    { stdout, stderr, get-stdin, read-ln: readln, debug: dbg } = winjs.process.io
    { control-chars } = dependency 'native.String'

    { lf } = control-chars

    write = (fn, args) -> fn [ (String arg) for arg in args ] * ' '

    out = -> write stdout, arguments

    outln = -> out ... ; out lf

    lnout = -> out lf ; out ...

    err = -> write stderr, arguments

    errln = -> err ... ; err lf

    lnerr = -> err lf ; err ...

    debug = -> dbg [ (String arg) for arg in arguments ] * ' '

    stdin = -> get-stdin!

    {
      out, outln, lnout,
      err, errln, lnerr
      debug,
      readln,
      stdin
    }