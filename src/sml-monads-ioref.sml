structure SMLMonadsIORef :> SML_MONADS_IOREF = struct

  structure IO = SMLMonadsIO

  type 'a t = 'a ref

  fun make v = IO.make(fn () => ref v)
  fun read ptr = IO.make(fn () => !ptr)
  fun write (ptr, v) = IO.make(fn () => ptr := v)
  fun modify (ptr, f) = IO.make(fn () => ptr := f (!ptr))

end
