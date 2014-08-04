---
layout: post
title: "Possibly unevaluated variables"
date: 2014-07-31 16:11:40 -0700
comments: true
categories: scala
---

```scala
scala> def loop: Boolean = loop
<console>:10: warning: method loop does nothing other than call itself recursively
       def loop: Boolean = loop
                           ^
loop: Boolean

scala> true || loop
res34: Boolean = true

scala> true && loop

[need to Ctrl-C out at this point]
```

(I like that warning message!)