infix 1 >> >>=

structure Main :
sig
  val main : (string * string list) -> int
end = struct
  open SMLMonadsIO
  structure IORef = SMLMonadsIORef

  fun main _ =
      (print
           (Int.toString
                (unsafePerformIO
                     (IORef.make 0 >>= (fn ptr =>
                      replicateM_
                          (100000,
                           IORef.read ptr >>= (fn i =>
                           IORef.write(ptr, i+1)))
                          >> IORef.read ptr))));
      0)
end
