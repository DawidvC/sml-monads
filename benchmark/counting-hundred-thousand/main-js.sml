infix 1 >> >>=

open SMLMonadsStateCPS

val () = prim("execStmtJS", ("console.log(i)", "i", exec (replicateM_(100000, get >>= (fn i => put(i+1)))) 0))
