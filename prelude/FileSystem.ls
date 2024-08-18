
  do ->

    { Str } = dependency 'primitive.Type'

    { file-system: fs } = os

    file-exists = -> fs.file-exists Str it

    folder-exists = -> fs.folder-exists Str it

    get-current-folder = -> fs.get-current-folder!

    set-current-folder = -> fs.set-current-folder Str it

    read-text-file = -> fs.read-text-file Str it

    {
      file-exists, folder-exists,
      get-current-folder, set-current-folder,
      read-text-file
    }

