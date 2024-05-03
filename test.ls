
  { new-test-suite } = dependency 'test.Suite'

  { scenario, expect, subject } = new-test-suite!

  scenario "prelude", ->

    scenario "String", ->

      { char, replicate, trim } = dependency 'prelude.String'

      scenario "char", ->

        expect -> subject (-> char 65 ) .to-return 'A'

      scenario "replicate" ->

        expect -> subject (-> replicate (char 66), 3) .to-return 'BBB'

      scenario "replicate", ->

        expect -> subject (-> trim '\n abc\t\r' ) .to-return 'abc'

      { upper-case, lower-case, camel-case, capital-case } = dependency 'prelude.String'

      scenario "upper-case", ->

        expect -> subject (-> upper-case 'abc') .to-return 'ABC'

      scenario "lower-case", ->

        expect -> subject (-> lower-case 'ABC') .to-return 'abc'

      scenario "camel-case", ->

        expect -> subject (-> camel-case 'camel-case') .to-return 'camelCase'
        expect -> subject (-> camel-case 'camel_case') .to-return 'camelCase'

      scenario "capital-case", ->

        expect -> subject (-> capital-case 'capital-case') .to-return 'Capital-Case'
        expect -> subject (-> capital-case 'capital case') .to-return 'Capital Case'

      { string-from-array } = dependency 'prelude.String'

      scenario "string-from-array", ->

        expect -> subject (-> string-from-array [ 1, false, 'a' ], '-') .to-return '1-false-a'
        expect -> subject (-> string-from-array [ 1 2 3 ]) .to-return '123'

    scenario "Array", ->

      { map, each, fold, unfold } = dependency 'prelude.Array'

      scenario "map", ->

        expect -> subject (-> array = [ 1 2 3 ] ; array `map` -> it * 2) .to-return [ 2 4 6 ]

      scenario "each", ->

        each-fn = ->

          array = [ 1 2 3 ]

          result = []

          each array, ->  ; result.push it - 1

          result

        expect -> subject each-fn .to-return [ 0 1 2 ]

      scenario "fold", ->

        fold-fn = -> array = [ 1 2 3 ] ; fold array, 10, (memento, value) -> memento + value

        expect -> subject fold-fn .to-return 16

      scenario "unfold", ->

        unfold-fn = -> unfold 2, (item, array) -> if array.length < 3 then [ item * 2, item + 1 ] else null

        expect -> subject unfold-fn .to-return [ 4 6 8 ]

    scenario "Function", ->

      { parameters-of, code-of } = dependency 'prelude.Function'

      scenario "parameters-of", ->

        expect -> subject (-> parameters-of (first, last) ->) .to-return <[ first last ]>

      scenario "code-of", ->

        expect -> subject (-> code-of -> return 1) .to-return 'return 1;'

      { function-as-string } = dependency 'prelude.Function'

      scenario "function-as-string", ->

        expect -> subject (-> function-as-string ->) .to-return '-> {}'
        expect -> subject (-> function-as-string (first, last) -> return last) .to-return '( first, last ) -> { return last; }'

      { function-code-from-strings } = dependency 'prelude.Function'

      scenario "function-code-from-strings", ->

        expect -> subject (-> function-code-from-strings 'first, last', [ 'return 1' ]) .to-return '( first, last ) => { return 1 ; } ;'
        expect -> subject (-> function-code-from-strings [ 'return 1' ]) .to-return '() => { return 1 ; } ;'

    scenario "Text", ->

      { separators, line-breaks } = dependency 'prelude.Text'
      { char } = dependency 'prelude.String'

      scenario "separators", ->

        expect -> subject (-> separators.file is char 28 ) .to-return yes
        expect -> subject (-> separators.group is char 29 ) .to-return yes
        expect -> subject (-> separators.record is char 30 ) .to-return yes
        expect -> subject (-> separators.unit is char 31 ) .to-return yes

      scenario "line-breaks", ->

        expect -> subject (-> line-breaks.lf is '\n') .to-return yes
        expect -> subject (-> line-breaks.crlf is '\r\n') .to-return yes

      { replace-lf, replace-crlf } = dependency 'prelude.Text'

      scenario "replace-lf", ->

        expect -> subject (-> replace-lf "A#{ line-breaks.lf }B\nC", '') .to-return 'ABC'
        expect -> subject (-> replace-lf "A#{ line-breaks.lf }B\nC", '.') .to-return 'A.B.C'
