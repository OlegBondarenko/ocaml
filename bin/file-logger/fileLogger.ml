let log(x: string) =  
  let oc = open_out_gen [Open_creat; Open_append; Open_nonblock] 0o777 "file.txt" in
  Printf.fprintf oc x;