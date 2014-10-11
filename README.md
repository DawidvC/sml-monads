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
* MLKit
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
[parsing src/(sml-monads.cm):applicative.sig]
[parsing src/(sml-monads.cm):applicative.sml]
[parsing src/(sml-monads.cm):alternative.sig]
[parsing src/(sml-monads.cm):alternative.sml]
[parsing src/(sml-monads.cm):monad.sig]
[parsing src/(sml-monads.cm):monad.sml]
[parsing src/(sml-monads.cm):monad-plus.sig]
[parsing src/(sml-monads.cm):monad-plus.sml]
[parsing src/(sml-monads.cm):monad-state.sig]
[parsing src/(sml-monads.cm):monad-state.sml]
[parsing src/(sml-monads.cm):sml-monads-io.sig]
[parsing src/(sml-monads.cm):sml-monads-io.sml]
[parsing src/(sml-monads.cm):sml-monads-identity.sig]
[parsing src/(sml-monads.cm):sml-monads-identity.sml]
[parsing src/(sml-monads.cm):sml-monads-const.sig]
[parsing src/(sml-monads.cm):sml-monads-const.sml]
[parsing src/(sml-monads.cm):sml-monads-option.sig]
[parsing src/(sml-monads.cm):sml-monads-option.sml]
[parsing src/(sml-monads.cm):sml-monads-state.sig]
[parsing src/(sml-monads.cm):sml-monads-state.sml]
[parsing src/(sml-monads.cm):lens.sml]
[library $SMLNJ-BASIS/basis.cm is stable]
- open SMLMonadsOption;
[autoloading]
[autoloading done]
opening SMLMonadsOption
  type 'a t = 'a option
  val fmap : ('a -> 'b) * 'a t -> 'b t
  val <$> : ('a -> 'b) * 'a t -> 'b t
  val <$ : 'b * 'a t -> 'b t
  val $> : 'a t * 'b -> 'b t
  val void : 'a t -> unit t
  val pure : 'a -> 'a t
  val <*> : ('a -> 'b) t * 'a t -> 'b t
  val <**> : 'a t * ('a -> 'b) t -> 'b t
  val *> : 'a t * 'b t -> 'b t
  val <* : 'b t * 'a t -> 'b t
  val liftA : ('a -> 'b) -> 'a t -> 'b t
  val liftA2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
  val liftA3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
  val empty : 'a t
  val <|> : 'a t * 'a t -> 'a t
  val some : 'a t -> 'a list t
  val many : 'a t -> 'a list t
  val optional : 'a t -> 'a option t
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
  val mapAndUnzipM : ('a -> ('b * 'c) t) * 'a list -> ('b list * 'c list) t
  val zipWithM : ('a * 'b -> 'c t) * 'a list * 'b list -> 'c list t
  val zipWithM_ : ('b * 'c -> 'a t) * 'b list * 'c list -> unit t
  val foldM : ('b * 'a -> 'b t) * 'b * 'a list -> 'b t
  val foldM_ : ('a * 'b -> 'a t) * 'a * 'b list -> unit t
  val replicateM : int * 'a t -> 'a list t
  val replicateM_ : int * 'a t -> unit t
  val when : bool * unit t -> unit t
  val unless : bool * unit t -> unit t
  val liftM : ('a -> 'b) -> 'a t -> 'b t
  val liftM2 : ('a * 'b -> 'c) -> 'a t * 'b t -> 'c t
  val liftM3 : ('a * 'b * 'c -> 'd) -> 'a t * 'b t * 'c t -> 'd t
  val liftM4 : ('a * 'b * 'c * 'd -> 'e) -> 'a t * 'b t * 'c t * 'd t -> 'e t
  val liftM5 : ('a * 'b * 'c * 'd * 'e -> 'f)
               -> 'a t * 'b t * 'c t * 'd t * 'e t -> 'f t
  val ap : ('a -> 'b) t * 'a t -> 'b t
  val mzero : 'a t
  val mplus : 'a t * 'a t -> 'a t
  val msum : 'a t list -> 'a t
  val mfilter : ('a -> bool) * 'a t -> 'a t
  val guard : bool -> unit t
```
