signature SML_MONADS_IO = sig
  include MONAD2
  val make : (unit -> 'a) -> ('r, 'a) t
  val unsafePerformIO : ('a, 'a) t -> 'a
  val lift1 : ('a -> 'b) -> 'a -> ('r, 'b) t
  val lift2 : ('a * 'b -> 'c) -> 'a * 'b -> ('r, 'c) t
  val lift3 : ('a * 'b * 'c -> 'd) -> 'a * 'b * 'c -> ('r, 'd) t
  val lift4 : ('a * 'b * 'c * 'd -> 'e) -> 'a * 'b * 'c * 'd -> ('r, 'e) t
  val lift5 : ('a * 'b * 'c * 'd * 'e -> 'f) -> 'a * 'b * 'c * 'd * 'e -> ('r, 'f) t
end
