
  do ->

    map = (array, fn) -> [ (fn value, index, array) for value, index in array ]

    each = (array, fn) ->

      for value, index in array => fn value, index, array

      array

    fold = (array, memento, fn) ->

      for value, index in array => memento := fn memento, value, index, array

      memento

    unfold = (seed, fn) ->

      # builds a list from a seed
      # it takes a function which either returns null if it is done producing values for the list
      # or returns [ x, y ],
      # x is added to the list
      # y is used as the next element in the recursive call

      array = []
      item = seed

      while (fn item, array, seed)?

        array.push that.0
        item = that.1

      array

    {
      map, each,
      fold, unfold
    }