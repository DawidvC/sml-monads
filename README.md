## sml-monads

sml-monads は Haskell の base ライブラリの一部を
SML にポートしたライブラリです。

まだ始めたばかりですが、気の向くままにいろいろ追加して
いきます。

### Supported Compilers

SML '97 に従って書かれています。
SML '97 をサポートするコンパイラならどれでも動作するはずです。
現在、次のコンパイラでテストされています。

* SML/NJ
* MLton
* SMLtoJs

### Status

- [x] [Data.Functor](http://hackage.haskell.org/package/base-4.7.0.1/docs/Data-Functor.html)
- [x] [Control.Applicative](http://hackage.haskell.org/package/base-4.7.0.1/docs/Control-Applicative.html)
- [x] [Control.Monad](http://hackage.haskell.org/package/base-4.7.0.1/docs/Control-Monad.html)
- [x] [Control.Monad.Identity](https://hackage.haskell.org/package/mtl-2.2.1/docs/Control-Monad-Identity.html)
- [x] [Control.Monad.State](https://hackage.haskell.org/package/mtl-2.2.1/docs/Control-Monad-State-Lazy.html)


### Try

cm, mlb を書いてあるので、 SML/NJ や MLton なら簡単に試すことができます。
例を示します。


```
$ sml src/sml-monads.cm
Standard ML of New Jersey v110.76 [built: Tue Oct 22 14:04:11 2013]
[scanning src/sml-monads.cm]
[parsing src/(sml-monads.cm):functor.sig]
[creating directory src/.cm/SKEL]
[parsing src/(sml-monads.cm):functor.sml]
[parsing src/(sml-monads.cm):applicative.sig]
[parsing src/(sml-monads.cm):applicative.sml]
[parsing src/(sml-monads.cm):alternative.sig]
[parsing src/(sml-monads.cm):alternative.sml]
[parsing src/(sml-monads.cm):monad.sig]
[parsing src/(sml-monads.cm):monad.sml]
[parsing src/(sml-monads.cm):monad-plus.sig]
[parsing src/(sml-monads.cm):monad-plus.sml]
[parsing src/(sml-monads.cm):sml-monads-option.sml]
- open SMLMonadsOption;
[autoloading]
[autoloading done]
opening SMLMonadsOption
  structure Alternative :
    sig
      type 'a t = 'a t
      structure Applicative : <sig>
      val empty : 'a t
      val <|> : 'a t * 'a t -> 'a t
      val some : 'a t -> 'a list t
      val many : 'a t -> 'a list t
      val optional : 'a t -> 'a option t
    end
  structure Monad :
    sig
      type 'a t = 'a t
      structure Functor : <sig>
      structure Applicative : <sig>
      val return : 'a -> 'a t
      val >>= : 'a t * ('a -> 'b t) -> 'b t
      val >> : 'a t * 'b t -> 'b t
      val mapM : ('a -> 'b t) * 'a list -> 'b list t
      val mapM_ : ('b -> 'a t) * 'b list -> unit t
      val forM : 'a list * ('a -> 'b t) -> 'b list t
      val forM_ : 'a list * ('a -> 'b t) -> unit t
      val sequence : 'a t list -> 'a list t
      val sequence_ : 'a t list -> unit t
      val =<< : ('a -> 'b t) * 'a t -> 'b t
      val >=> : ('b -> 'a t) * ('a -> 'c t) -> 'b -> 'c t
      val <=< : ('a -> 'c t) * ('b -> 'a t) -> 'b -> 'c t
      val join : 'a t t -> 'a t
      val filterM : ('a -> bool t) * 'a list -> 'a list t
      val when : bool * unit t -> unit t
      val unless : bool * unit t -> unit t
      val liftM : ('a -> 'b) -> 'a t -> 'b t
      val liftM2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
      val liftM3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
      val liftM4 : ('a * 'b * 'c * 'd -> 'e)
                   -> 'a t * 'b t * 'c t * 'd t -> 'e t
      val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
                   -> 'a t * 'b t * 'c t * 'd t * 'e t -> 'f t
      val ap : ('a -> 'b) t * 'a t -> 'b t
    end
  val mzero : 'a option
  val mplus : 'a option * 'a option -> 'a option
  val msum : 'a option list -> 'a option
  val mfilter : ('a -> bool) * 'a option -> 'a option
  val guard : bool -> unit option
  val return : 'a -> 'a option
  val >>= : 'a option * ('a -> 'b option) -> 'b option
  val >> : 'a option * 'b option -> 'b option
  val mapM : ('a -> 'b option) * 'a list -> 'b list option
  val mapM_ : ('b -> 'a option) * 'b list -> unit option
  val forM : 'a list * ('a -> 'b option) -> 'b list option
  val forM_ : 'a list * ('a -> 'b option) -> unit option
  val sequence : 'a option list -> 'a list option
  val sequence_ : 'a option list -> unit option
  val =<< : ('a -> 'b option) * 'a option -> 'b option
  val >=> : ('b -> 'a option) * ('a -> 'c option) -> 'b -> 'c option
  val <=< : ('a -> 'c option) * ('b -> 'a option) -> 'b -> 'c option
  val join : 'a option option -> 'a option
  val filterM : ('a -> bool option) * 'a list -> 'a list option
  val when : bool * unit option -> unit option
  val unless : bool * unit option -> unit option
  val liftM : ('a -> 'b) -> 'a option -> 'b option
  val liftM2 : ('a * 'b -> 'c) -> 'a option * 'b option -> 'c option
  val liftM3 : ('a * 'b * 'c -> 'd)
               -> 'a option * 'b option * 'c option -> 'd option
  val liftM4 : ('a * 'b * 'c * 'd -> 'e)
               -> 'a option * 'b option * 'c option * 'd option -> 'e option
  val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
               -> 'a option * 'b option * 'c option * 'd option * 'e option
                  -> 'f option
  val ap : ('a -> 'b) option * 'a option -> 'b option
  structure Applicative :
    sig
      type 'a t = 'a t
      structure Functor : <sig>
      val pure : 'a -> 'a t
      val <*> : ('a -> 'b) t * 'a t -> 'b t
      val <**> : 'a t * ('a -> 'b) t -> 'b t
      val *> : 'a t * 'b t -> 'b t
      val <* : 'b t * 'a t -> 'b t
      val liftA : ('a -> 'b) -> 'a t -> 'b t
      val liftA2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
      val liftA3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
    end
  val empty : 'a option
  val <|> : 'a option * 'a option -> 'a option
  val some : 'a option -> 'a list option
  val many : 'a option -> 'a list option
  val optional : 'a option -> 'a option option
  structure Functor :
    sig
      type 'a t = 'a t
      val fmap : ('a -> 'b) * 'a t -> 'b t
      val <$> : ('a -> 'b) * 'a t -> 'b t
      val <$ : 'b * 'a t -> 'b t
      val $> : 'a t * 'b -> 'b t
      val void : 'a t -> unit t
    end
  val pure : 'a -> 'a option
  val <*> : ('a -> 'b) option * 'a option -> 'b option
  val <**> : 'a option * ('a -> 'b) option -> 'b option
  val *> : 'a option * 'b option -> 'b option
  val <* : 'b option * 'a option -> 'b option
  val liftA : ('a -> 'b) -> 'a option -> 'b option
  val liftA2 : ('a * 'b -> 'c) -> 'a option * 'b option -> 'c option
  val liftA3 : ('a * 'b * 'c -> 'd)
               -> 'a option * 'b option * 'c option -> 'd option
  type 'a t = 'a option
  val fmap : ('a -> 'b) * 'a option -> 'b option
  val <$> : ('a -> 'b) * 'a option -> 'b option
  val <$ : 'b * 'a option -> 'b option
  val $> : 'a option * 'b -> 'b option
  val void : 'a option -> unit option
- fmap (fn x => x + 1, SOME 42);
val it = SOME 43 : int t
```
