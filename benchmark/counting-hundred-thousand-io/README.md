## Counting hundred thousand

IORef を使用して、単に10万回繰り返すだけのプログラムの
ベンチマークです。

### SML/NJ

```
$ ml-build main.cm Main.main
$ time sml @SMLload main
real	0m0.045s
user	0m0.020s
sys	0m0.007s
```

### MLton

```
$ mlton main.mlb
$ time ./main 
real	0m0.006s
user	0m0.003s
sys	0m0.002s
```

### MLKit

```
$ mlkit main.mlb
$ time ./run
100000
real	0m0.013s
user	0m0.013s
sys	0m0.001s
```

### GHC

GHC との比較。

```
$ ghc -O3 Main.hs
$ time ./Main 
real	0m0.013s
user	0m0.009s
sys	0m0.003s
```

### 結果

MLton がもっとも高速で、次点に MLKit と GHC がほぼ等しく、
最後に SML/NJ となる結果になりました。