open Clogger

let () =
  if Array.length Sys.argv - 1 < 1 then exit 0;
  let amountOfChildren = Sys.argv.(1) in

  let isNumber = Str.string_match (Str.regexp "^[0-9]+$") amountOfChildren 0 in

  if isNumber = false then (
    Format.printf "unknown number of child processes %s. \n" amountOfChildren;
    exit 0);
  Format.printf "Result %s %b .\n" amountOfChildren isNumber;

  let formatMessage =
    Printf.sprintf "Result formatted %s %b" amountOfChildren isNumber
  in
  Clogger.logInfo formatMessage;

  Logs.set_reporter (Logs.format_reporter ());
  Logs.set_level (Some Logs.Info);
  let sock = Server.create_socket () in
  let serve = Server.create_server sock in
  Lwt_main.run @@ serve ()
