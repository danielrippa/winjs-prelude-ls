
  do ->

    object-from-arrays = (names, values) -> { [ name, values[index] ] for name, index in names }
    object-from-array  = (names)         -> { [ name, name ] for name in names }

    object-from-array-and-function = (array, fn) -> { [ (name), (fn name, index, array) ] for name, index in array }

    map = (object, fn) -> { [ (name), (fn value, name, object) ] for name, value of object }

    each = (object, fn) ->

      for name, value of object => fn name, value, object

      object

    fold = (object, memento, fn) ->

      for name, value of object => memento := fn memento, name, value, object

      memento

    {
      object-from-arrays,
      object-from-array,
      object-from-array-and-function,
      map, each, fold
    }