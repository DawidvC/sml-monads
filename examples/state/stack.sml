structure Example = struct

  datatype err = OOPS of string
  structure M = SMLMonadsStateT(SMLMonadsEither1(type left_t = err))
  open M
  infix 1 >> >>=

  fun push x = get >>= (fn xs => put (x :: xs))

  fun pop () = get >>= (fn [] => lift (Either.LEFT (OOPS "Stack is empty."))
                       | (x :: xs) => put xs >> return x)

  fun oops () = push "42" >>
                pop () >>= (fn i =>
                ( print i
                ; pop () >>= (fn j =>
                ( print j
                ; return () ))))

  fun example () = run (oops()) []
end
