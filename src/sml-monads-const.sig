signature SML_MONADS_CONST = sig
  include FUNCTOR2
  val make : 'a -> ('a, 'b) t
  val run : ('a, 'b) t -> 'a
end
