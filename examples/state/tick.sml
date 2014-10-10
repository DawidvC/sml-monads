structure Example = struct

open SMLMonadsState

infix 1 >> >>=

val tick : (int,int,int) t = get >>= (fn n => put(n+1) >> return n)
fun plusOne n = exec tick n
fun plus n x = exec (replicateM(n, tick)) x

end
