structure Example = struct

open SMLMonadsState

infix 1 >> >>=

fun tick eta = (get >>= (fn n => put(n+1) >> return n)) eta
fun plusOne n = exec tick n
fun plus n x = exec (replicateM(n, tick)) x

end
