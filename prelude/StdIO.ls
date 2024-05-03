
  do ->

    { stdout, stderr, get-stdin, read-ln, debug } = winjs.process.io
    { line-breaks } = dependency 'prelude.Text'

    { lf } = line-breaks

    out = !-> for arg in arguments => stdout String arg

    lnout = !-> out lf ; out ...
    outln = !-> out ... ; out lf

    err = !-> for arg in arguments => stderr String arg

    lnerr = !-> err lf ; err ...
    errln = !-> err ... ; err lf

    {
      out, lnout, outln,
      err, lnerr, errln
      get-stdin,
      read-ln,
      debug
    }