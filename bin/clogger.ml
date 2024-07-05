
module Clogger = struct
  let test x = Format.printf "%s.\n" x
  
  let logInfo x =
    let oc =
      open_out_gen [ Open_creat; Open_append; Open_nonblock ] 0o777 "file.txt"
    in
    Printf.fprintf oc "[Info] %s.\n" x;     
end
