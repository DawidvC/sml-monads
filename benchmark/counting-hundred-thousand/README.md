## Counting hundred thousand

State モナドを使用して、単に10万回繰り返すだけのプログラムの
ベンチマークです。

### SML/NJ

```
$ ml-build main.cm Main.main
$ time sml @SMLload main
100000
real	0m0.044s
user	0m0.026s
sys	0m0.022s
```

### MLton

```
$ mlton main.mlb
$ time ./main
100000
real	0m0.007s
user	0m0.004s
sys	0m0.004s
```

### MLKit

```
$ mlkit main.mlb
$ time ./run
100000
real	0m0.014s
user	0m0.004s
sys	0m0.010s
```

### GHC

GHC との比較。

```
$ ghc -O3 Main.hs
$ time ./Main 
real   0m0.014s
user   0m0.010s
sys    0m0.003
```

### 結果

MLton がもっとも高速で、次点に GHC 、その次に MLKit 、
最後に SML/NJ となる結果になりました。