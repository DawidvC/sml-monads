infix 1 >> >>=

structure Main :
sig
  val main : (string * string list) -> int
end = struct
  open SMLMonadsState

  fun main _ = (
      print (Int.toString (exec (replicateM_(100000, get >>= (fn i => put(i+1)))) 0));
      0)
end
