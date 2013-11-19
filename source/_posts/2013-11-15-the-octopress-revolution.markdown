---
layout: post
title: "The Octopress Revolution"
date: 2013-11-15 17:06
comments: true
categories: Octopress Jekyll
---

Stumbled across Octopress and realized I could get a "better minimalism" with
it.

First, you have to get it.

```bash
  $  git clone
  git://github.com/imathis/octopress.git
  octopress
```

Then, you have to get a few dependencies.

```bash
$ ruby --version
ruby 1.8.7 (2011-06-30 patchlevel 352) [x86_64-linux]

$ curl -L https://get.rvm.io | bash -s stable --ruby
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
  Dload  Upload   Total   Spent    Left  Speed
  100   184  100   184    0     0    468      0
  --:--:-- --:--:-- --:--:--  1688
  100 19527  100 19527    0     0  37740      0
  --:--:-- --:--:-- --:--:-- 37740
  Please read and follow further instructions.
  Downloading RVM branch stable
  ...

  $ source /home/agam/.rvm/scripts/rvm

  $ rvm install 1.9.3

  $ rvm use 1.9.3

  $ rvm rubygems latest
```

(Note: [rbenv](http://rbenv.org/) is an alternative to [rvm](http://rvm.io/) above)

The next step is to set up some of the gems we downloaded.

```bash
  $  cd octopress

  $ gem install bundler
Fetching: bundler-1.3.5.gem (100%)
  Successfully installed bundler-1.3.5
  Installing ri documentation for bundler-1.3.5
  1 gem installed

  $ bundle install
  Fetching gem metadata from
  https://rubygems.org/.......
  Fetching gem metadata from
  https://rubygems.org/..
  Installing rake (0.9.2.2) 
  Installing RedCloth (4.2.9) 
  Installing chunky_png (1.2.5) 
  Installing fast-stemmer (1.0.1) 
  Installing classifier (1.3.3) 
  Installing fssm (0.2.9) 
  Installing sass (3.2.9) 
  Installing compass (0.12.2) 
  Installing directory_watcher (1.4.1) 
  Installing haml (3.1.7) 
  Installing kramdown (0.13.8) 
  Installing liquid (2.3.0) 
  Installing syntax (1.0.0) 
  Installing maruku (0.6.1) 
  Installing posix-spawn (0.3.6) 
  Installing yajl-ruby (1.1.0) 
  Installing pygments.rb (0.3.4) 
  Installing jekyll (0.12.0) 
  Installing rack (1.5.2) 
  Installing rack-protection (1.5.0) 
  Installing rb-fsevent (0.9.1) 
  Installing rdiscount (2.0.7.3) 
  Installing rubypants (0.2.0) 
  Installing sass-globbing (1.0.0) 
  Installing tilt (1.3.7) 
  Installing sinatra (1.4.2) 
  Installing stringex (1.4.0) 
Using bundler (1.3.5) 
  Your bundle is complete!
  Use `bundle show [gemname]` to see where a
  bundled gem is installed.
```

Finally, we're ready to get a "blank blog" up and running

```bash
  $ rake install
## Copying classic theme into ./source and
  ./sass
  mkdir -p source
  cp -r .themes/classic/source/. source
  mkdir -p sass
  cp -r .themes/classic/sass/. sass
  mkdir -p source/_posts
  mkdir -p public
```

I use Github Pages, but this setup works out of the box with Heroku (or just
plain rsync) too.

```bash
  $ rake setup_github_pages
  Enter the read/write url for your repository
  (For example,
   'git@github.com:your_username/your_username.github.io.git)
  or
  'https://github.com/your_username/your_username.github.io')
  Repository url:
  https://github.com/agam/agam.github.com.git
  Added remote
  https://github.com/agam/agam.github.com.git
  as origin
  Set origin as default remote
  Master branch renamed to 'source'
  for committing your blog source
  files
  rm -rf _deploy
  mkdir _deploy
  cd _deploy
  Initialized empty Git repository
  in
  /home/agam/Documents/octopress/_deploy/.git/
  [master (root-commit) 5a90a3a]
  Octopress init
1 file changed, 1 insertion(+)
  create mode 100644 index.html
  cd -
```

Take a look at what we made !

```bash
  $ rake generate

  $ rake preview
```

Push it out and call it a day ...

```bash
  $ git add .

  $ git commit -m 'New (Empty) Blog'

  $ git push origin source
```

Migrating static content
-------------------------

But wait, in my case, I also need to get all my old stuff over.

```bash
  $ cp ../hakyll-source/posts/* source/_posts/
```

But when I try to generate again ... sadness

```bash
/usr/local/google/home/agam/Documents/octopress/plugins/pygments_code.rb:27:in
`rescue in pygments': Pygments can't parse unknown language: shell.
(RuntimeError)
from
/usr/local/google/home/agam/Documents/octopress/plugins/pygments_code.rb:24:in
`pygments'
from
/usr/local/google/home/agam/Documents/octopress/plugins/pygments_code.rb:14:in
`highlight'
from
/usr/local/google/home/agam/Documents/octopress/plugins/backtick_code_block.rb:37:in
`block in render_code_block'
from
/usr/local/google/home/agam/Documents/octopress/plugins/backtick_code_block.rb:13:in
`gsub'
from
/usr/local/google/home/agam/Documents/octopress/plugins/backtick_code_block.rb:13:in
`render_code_block'
from
/usr/local/google/home/agam/Documents/octopress/plugins/octopress_filters.rb:12:in
`pre_filter'
from
/usr/local/google/home/agam/Documents/octopress/plugins/octopress_filters.rb:28:in
`pre_render'
from
/usr/local/google/home/agam/Documents/octopress/plugins/post_filters.rb:112:in
`block in
pre_render'
from
/usr/local/google/home/agam/Documents/octopress/plugins/post_filters.rb:111:in
`each'
from
/usr/local/google/home/agam/Documents/octopress/plugins/post_filters.rb:111:in
`pre_render'
from
/usr/local/google/home/agam/Documents/octopress/plugins/post_filters.rb:166:in
`do_layout'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/lib/jekyll/post.rb:195:in
`render'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/lib/jekyll/site.rb:200:in
`block
in
render'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in
`each'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/lib/jekyll/site.rb:199:in
`render'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/lib/jekyll/site.rb:41:in
`process'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/gems/jekyll-0.12.0/bin/jekyll:264:in
`<top
(required)>'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/bin/jekyll:23:in
`load'
from
/usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/bin/jekyll:23:in
`<main>'
from
  /usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/bin/ruby_executable_hooks:15:in
  `eval'
  from
  /usr/local/google/home/agam/.rvm/gems/ruby-1.9.3-p448/bin/ruby_executable_hooks:15:in
  `<main>'

```

[Nothing to panic](https://plus.google.com/photos?pid=5946667874240500674&oid=116824588290880385608) about, turns out I just had to use different names for the
[Lexers in Pygments](http://pygments.org/docs/lexers/). So it's "sh" or "bash"
instead of "shell", and "haskell" instead of "Haskell".

Also, I had to make other cosmetic changes like
- changing the title to be in the _yyyy-mm-dd-title_ format
- added quotes around the 'title' in the header metadata
- added categories (retroactively) for each post

Sorting out the old repo
-------------------------

Almost there, but not there yet. Running `rake deploy` doesn't work out of the
box:

```sh
 ! [rejected]        master -> master (non-fast-forward)
 error: failed to push some refs to
 'https://github.com/agam/agam.github.com.git'
 hint: Updates were rejected because the tip of your current branch is behind
 hint: its remote counterpart. Integrate the remote changes (e.g.
 hint: 'git pull ...') before pushing again.
 hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```

