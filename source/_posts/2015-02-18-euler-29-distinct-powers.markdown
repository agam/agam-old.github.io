---
layout: post
title: "Euler 29: Distinct Powers"
date: 2015-02-18 00:56:01 +0000
comments: true
categories: projecteuler haskell
---

**Statutory Warning**: _Spoilers ahead!_

Finally, we have a one-liner:

```haskell
euler29 = length $ L.nub $ [a ^ b | a <- [2 .. 100], b <- [2 .. 100]]
```

(where `L` is `Data.List`)

_P.S._ I did make a dumb error by initiall writing this as two functions, with the second one taking `Int` instead of `Integer`, which (I'm disappointed to say) resulted in everything silently overflowing to negative numbers.
