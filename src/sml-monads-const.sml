structure SMLMonadsConst :> SML_MONADS_CONST = struct
  type ('a, 'b) t = 'a

  fun make (x : 'a) : ('a, 'b) t = x
  fun run (x : ('a, 'b) t) : 'a = x

  local structure Functor2 = Functor2
                                (struct
                                  type ('a, 'b) t = ('a, 'b) t
                                  fun fmap (_, x) = x
                                  end)
  in
    open Functor2
  end
end
