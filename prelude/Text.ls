
  do ->

    { char, array-as-string } = dependency 'prelude.String'

    separators =

      file: char 28
      group: char 29
      record: char 30
      unit: char 31

    { record: rs, unit: us } = separators

    line-breaks =

      lf: '\n'
      crlf: '\r\n'

    { crlf, lf } = line-breaks

    replace-crlf = (string, separator = rs) -> string.replace /\r\n/g, separator
    replace-lf =   (string, separator = rs) -> string.replace /\n/g, separator

    array-as-records = (.join rs)
    records-as-array = (.split rs)

    array-as-text = (array, separator = crlf) -> array.join separator

    text-as-records = -> it |> replace-crlf |> replace-lf
    records-as-text = (records, separator = crlf) -> records |> records-as-array |> array-as-text _ , separator

    text-as-array = -> it |> text-as-records |> records-as-array
    text-as-string = (text, separator = crlf) -> text |> text-as-array |> array-as-string _ , separator

    {
      separators, line-breaks,
      replace-lf, replace-crlf,
      array-as-records, records-as-array,
      array-as-text, text-as-array,
      text-as-records, records-as-text,
      text-as-string
    }
