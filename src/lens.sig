signature GETTING = sig
  type ('z, 'a, 'b, 'c, 'd) t
  val at1 : ('z, 'a * 'c, 'b * 'c, 'a, 'b) t
  val view : ('c, 'a, 'b, 'c, 'd) t -> 'a -> 'c
end

signature SETTING = sig
  type ('a, 'b, 'c, 'd) t
  val at1 : ('a * 'c, 'b * 'c, 'a, 'b) t
  val set : ('a, 'b, 'c, 'd) t -> 'd -> 'a -> 'b
end
