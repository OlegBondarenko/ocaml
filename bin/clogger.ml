type logType = Info | Error | Warning

module Clogger = struct
  let logTypeToString = function
    | Info -> "Info"
    | Error -> "Error"
    | Warning -> "Warning"

  let test x = Format.printf "%s.\n" x

  let log (t : logType) (x : string) =
    let oc =
      open_out_gen [ Open_creat; Open_append; Open_nonblock ] 0o777 "file.txt"
    in

    Printf.fprintf oc "[%s] %s.\n" (logTypeToString t) x

  let logInfo x = log Info x
  let logWarning x = log Warning x
  let logError x = log Error x
end
