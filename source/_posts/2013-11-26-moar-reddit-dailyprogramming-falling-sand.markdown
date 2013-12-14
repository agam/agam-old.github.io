---
layout: post
title: "Moar Reddit DailyProgramming: Falling Sand"
date: 2013-11-26 17:33
comments: true
categories: reddit, AlwaysBeCoding
---

Another [easy challenge](http://www.reddit.com/r/dailyprogrammer/comments/1rdtky/111113_challenge_142_easy_falling_sand/).

One thing I learnt while doing this: I had to test the program with standard
input and had created a couple of files with sample input that I could pipe in.
I wasted a lot of time debugging a spurious newline (!), so in the future I
should remember to do the following:

```sh
set listchars=eol:$
```

What this does is show you `$` wherever the file has `\n` in it, so you can use
this to distinguish between 'real' spaces and whitespace.

{% gist 7669304 %}
