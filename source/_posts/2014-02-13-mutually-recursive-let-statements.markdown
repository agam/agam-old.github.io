---
layout: post
title: "Mutually recursive LET statements"
date: 2014-02-13 02:52
comments: true
categories: LambdaCalculus, AbstractSyntax, Semantics
---

(Apologies for how "out of the blue" this appears -- the right way would have been to plan a whole series of these and then lead up to something and so on ... but _something is better than nothing_, isn't it?)

I was reading the chapter on _abstract syntax_ in Peter Kogge's excellent book ["The Architecture of Symbolic Computers"](http://www.amazon.com/Architecture-Computers-Mcgraw-Hill-Supercomputing-Processing/dp/0070355967).

He mentioned a way to construct a mapping from lambda calculus to abstract syntax for _two_ mutually recursive functions in a `LET` block, and left the case for _three_ functions as an exercise for the reader.

Just for context, the abstract `LET` would look something like

```scheme
LET f(x) = x + 2
IN
f(3) * 2
```

while the abstract `LETREC` would loo like

```scheme
LETREC f(x,y) = g(y) * 2
AND    g(x) = x + 4
IN
f(4,5) + g(2)
```

So here is my short solution: Given something like

```scheme
LETREC f(x,y) = g(y) * 2 * h(x)
AND    g(y) = h(y) - 5
AND    h(z) = f(z, 3)
IN
f(4,5)
```

where functions `f`, `g` and `h` have function bodies `F`, `G` and `H` respectively, we would replace the expression by something like

```scheme
(lambda(fghxy)|f 4 5) (Y1 R S T) (Y2 R S T) (Y3 R S T)
```

where

```scheme
R = lambda(rst) | f (r r s t) (s r s t) (t r s t)
S = lambda(rst) | g (r r s t) (s r s t) (t r s t)
T = lambda(rst) | h (t r s t) (s r s t) (t r s t)
```

such that

```
Y1 R S T = F (Y1 R S T) (Y2 R S T) (Y3 R S T)
Y2 R S T = G (Y1 R S T) (Y2 R S T) (Y3 R S T)
Y3 R S T = H (Y1 R S T) (Y2 R S T) (Y3 R S T)
```

I'm not sure if that's all kosher, but let me know if it isn't!

(If the functions were _not_ mutually recursive, `(lambda(fgh)|f 4 5) F G H` is what this would've simplified into)

