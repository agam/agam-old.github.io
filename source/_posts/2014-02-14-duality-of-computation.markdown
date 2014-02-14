---
layout: post
title: "Duality of Computation"
date: 2014-02-14 00:22
comments: true
categories: Computation, TuringMachine, LambdaCalculus
---

The notion of computabilty includes two very different abstractions -- turing machines, and lambda calculus. I like to think of them as representing two extreme ends of a spectrum.

## Turing's Zoo of Things

One, the turing machine, deals very specifically with _things_. Things are encoded in some form, and by jumping back and forth, reading and writing individual _bits_, we can transform some things into different things, or "create" and "destroy" things.

### Doing, Doing, Always Doing

All operations in the turing machine are essentially some sort of "thing" operations. An operation may or may not change the given representation of some object that is its nominal argument, but it has to _do_ something. This _doing_ has to be represented by the modification of _some_ state, _somewhere_.

### Turingness, Complete

The fact that we are able to construct large ordered sets of bits, trillions of them clustered in a tiny physical volume, is why the abstraction of the turing machine most closely matches our physical computers.

## Frozen Functions, Frozen Time

Lambda Calculus exists at the other end of this computation spectrum. Here everything is a _pattern_ (a _function_, but that name is so overloaded everywhere -- how else to refrain from confusing these with the _operations_ in the turing machine?).

"Constants" are patterns too. `One` and `Two` are just "a pattern that looks like this" or "a pattern that looks like that". More complicated patterns might be composed of simpler ones, though what is "complex" vs "simple", or "large" vs "small" is not readily apparent here.

So what is analogous to the turing machine's _doing_, here ? It might be _application_.

### (Apply This)

Application is this strange (process? idea?) concept where the conjunction of two patterns can _result_ in a new pattern. Except it doesn't really (or at least I don't think of it that way).

The application of pattern `X` to pattern `Y` may _result_ in pattern `Z` (which by the way might be (representationally) vastly simpler than either, or more complicated than both), but this just means that `(X Y)` is a notation for `Z`, and if you had to refer to `Z` you would use whichever was shorter.

## Common ground: Agency

The only common concept that I see between the two is (atleast conceptually) the necessity (?) of an _agent_.

That is to say, whatever is _doing_ in a turing machine, is _applying_ in lambda calculus.

## Differences, or Analogies

One of the two _processes_ (if I may call them that) results in large scale state change, while the other results in different patterns being (created? revealed?) referenced.

One has built into it an explicit notion of digital time (steps in a turing machine) while the other doesn't. You might say that given state `s1` and current position `p`, after time `t` you would find state `s2`, but it's not obvious to me what the analogous concept in lambda calculus would be.

All patterns (or _forms_) already exist (in some sense) and while the agent, as the result of successive application (or _evaluation_) of a given "initial pattern" might "see" a series of patterns over time, there is no equivalent mapping of a pattern to an instant of time (though in practice, we can speak of the "representation" of a given pattern being evaluated at the current tick).

One has _meaning_ determined by some interpretation of the state at a given instant of time, the other has meaning determined by the _shape_ of the current pattern.

## Conclusion

I have none. This post ends abruptly, right here (again, apologies for being so vague; but thats why I posted my [_SOP_](http://agam.github.io/blog/2014/02/13/sop/)).


