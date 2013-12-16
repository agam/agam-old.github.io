---
layout: post
title: "Small change for Vim and Git"
date: 2013-12-16 06:04
comments: true
categories: vim, git
---

Vim
---

I hate seeing `.swp` and `~` files when I'm editing. If I really need to go back to an earlier version of something there are other ways.

So I added this to my .vimrc:

```
set nobackup
set nowritebackup
set noswapfile
```

Git
---

If there's one config change to make for `git`, it should be this one:

```
$ git config --global --add color.ui true
```

