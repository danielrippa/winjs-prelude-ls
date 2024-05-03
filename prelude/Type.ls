
  do ->

    type-name = (value) -> {} |> (.to-string) |> (.call value) |> (.slice 8, -1)

    as-string = (value) ->

      switch type-name value

        | \Function => function-as-string value
        | \String => "'#value'"

        else JSON.stringify value

    {
      type-name,
      as-string
    }