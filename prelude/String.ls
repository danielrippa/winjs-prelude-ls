
  do ->

    char = -> String.from-char-code it

    replicate = (string, n) -> new Array n + 1 |> (.join string)

    #

    trim-regex = /^[\s]+|[\s]+$/g

      # ^[\s]+ : ^ asserts the position at the start of the line
      #        : \s matches any whitespace character one or more times (+)

      # | : acts as an alternatives separator
      #   : allows the regex to match either the pattern before or the pattern after it

      # [\s]+$ : the $ symbol asserts the position at the end of the line

      # the regex matches both leading and trailing whitespace characters

    trim = (.replace trim-regex, '')

    #

    lower-case = (.to-lower-case!)
    upper-case = (.to-upper-case!)

    #

    camel-regex = /[-_]+(.)?/g

      # [-_]+ : matches one or more occurrences of either a hyphen - or an underscore _
      #       : the square brackets [] create a character set, and the + means one or more

      # (.)? : the parentheses () create a capturing group
      #      : inside the group there is a dot . which matches any single character except a newline.
      #      : the ? after the group makes it optional, meaning it can appear zero or one time

    camel-case = (.replace camel-regex, -> upper-case &1 ? '')

    #

    capital-regex = /\b\w/g

      # \b : matches a position where a word boundary occurs
      #    : it does not match an actual character, it identifies a position between characters
      #    : matches the transition from a word character (such as letters, digits, underscores) to a non-word character
      #    : matches the transition from a non-word character to a word-character

      # \w : represents a word character
      #    : matches letters (both uppercase and lowercase), digits, underscores

      # together they match all word boundaries followed by word characters

    capital-case = (.replace capital-regex, upper-case)

    #

    string-from-array = (array, separator = '') -> array.join separator

    {
      char,
      replicate,
      trim,
      upper-case, lower-case,
      camel-case, capital-case,
      string-from-array
    }
