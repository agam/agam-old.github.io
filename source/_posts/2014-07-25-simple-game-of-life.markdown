---
layout: post
title: "Simple game of life"
date: 2014-07-25 13:10:46 -0700
comments: true
categories: Lisp, Simulation
---

(Just for fun)

https://gist.github.com/agam/a832613064f958641330

Maybe I'll add a GUI and some tools later, but for now you have to do something like:

```
(start-game)
(add-life 4 5)
(add-life 5 5)
(add-life 6 5)
(print-board)
(step-board)
(print-board)
```

which should show

<pre>



    #
    #
    #



</pre>

followed by

<pre>



    ###





</pre>

and so on ...

_Update:_

It's easy to try out patterns. Here are a few typical ones:

https://gist.github.com/agam/527c5fa85b316c84e9ba

Then you can do something like

```
(loop repeat 5 do (print-board) (step-board))
```

and watch a few iterations. Of course, this is probably better implemented as a mobile app, I suppose. But yeah, still fun. Try out a [few other spaceships](http://wwwhomes.uni-bielefeld.de/achim/moving.html) if you like ...