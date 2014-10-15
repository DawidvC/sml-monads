signature FOLDABLE_MIN = sig
  type 'a t
  val foldr : ('a * 'b -> 'b) -> 'b -> 'a t -> 'b
end

signature FOLDABLE = sig
  type 'a t
  val foldr : ('a * 'b -> 'b) -> 'b -> 'a t -> 'b
end
