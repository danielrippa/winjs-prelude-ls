
  do ->

    winjs

      { sleep } = ..process

      { now, now-as-milliseconds } = ..os

      { get-current-folder, set-current-folder } = ..os.file-system

    {
      sleep,
      now, now-as-milliseconds,
      get-current-folder, set-current-folder
    }