---
layout: post
title: "Euler 26: Reciprocal Cycles"
date: 2015-02-11 18:07:38 +0000
comments: true
categories: projecteuler lisp
---

**Statutory Warning**: Spoilers ahead

_Problem: find the number less than 1000 with the largest repeating cycle of digits in the decimal expansion of its reciprocal_

As always, the initial reacion was on the lines of _aha! this is obvious!_:

```lisp
(defun get-repeated-substring-length (str len)
  (let* ((rev-str (reverse str))
	 (offset (- (length str) (* 2 len)))
	 (match (equal (subseq rev-str 0 len)
		       (reverse (subseq str offset (+ offset len))))))
    (if match
	len
	0)))


(defun get-cycle-length (dec)
  (declare (type double-float dec))
  (let* ((dec-str (princ-to-string dec))
	 (exp-str (subseq dec-str
			  (1+ (position #\. dec-str))
			  (position #\d dec-str))))
    (do ((i 0 (1+ i))
	 (cycle-length 0 (get-repeated-substring-length exp-str i)))
	((or (> cycle-length 0) (> i (/ (length exp-str) 2))) cycle-length))))


(defun inverse-cycle-digits (n)
  (let ((inverse (/ 1.0 (coerce n 'double-float))))
    (do* ((i 0 (1+ i))
	 (dec (* 1.0 inverse) (* 10.0 dec))
	 (cycle-length 0 (get-cycle-length dec)))
	 ((> cycle-length 0) cycle-length))))

(defun euler-26-fail ()
  (let ((all-cycles (mapcar #'inverse-cycle-digits (loop for i from 1 to 1000 collect i))))
    (reduce #'max all-cycles)))
```

But the aptly named `euler-26-fail` fails to do what we want, because once again, the largest reciprocal when expanded fully, lies beyond the standard _double-float_ range. So, we hand-roll ...

```lisp

(defun inverse (n &key (precision))
  (do* ((i 0 (1+ i))
	(numerator 10 (* 10 (mod numerator n)))
	(dec (floor (/ 10 n)) (floor (/ numerator n)))
	(declist (list dec) (cons dec declist)))
       ((> i precision) (nreverse declist))))

(defun cycle-length-helper (declist)
  (do ((i 0 (1+ i))
       (cycle-length 0 (get-repeated-substring-length declist i)))
      ((or (> cycle-length 0) (> i (/ (length declist) 2))) cycle-length)))

(defun cycle-length (declist)
  (loop for length in (loop for i from 1 to (length declist)
			 collect (cycle-length-helper (subseq declist 0 i)))
       maximizing length))

(defun get-all-inverse-lengths (lst max-precision)
  (mapcar #'(lambda (n) (cycle-length (inverse n :precision max-precision)))
	  lst))

(defun unique-max (list)
  (let ((max (reduce #'max list)))
    (if (= 1 (count max list))
	max
	0)))

(defun biggest-cycle (max-num prec)
  (let* ((lst (loop for i from 1 to  max-num collect i))
	 (lengths (get-all-inverse-lengths lst prec))
	 (max-len (reduce #'max lengths)))
    ;;(format t "Debug: lengths = ~A, max = ~A~%" lengths max-len)
    (nth (position max-len lengths) lst)))
```

The idea is to loop over all numbers with a given precision, find the max, then maybe increase the precision and try again. This is a terrible idea, relying on the ability to submit multiple answers at the Project Euler website :(

But more than that, it's terribly slow. It becomes marginally faster if we restrict our search to primes.

```lisp
(defun biggest-cycle (max-num prec)
  (let* ((lst (eratosthenes max-num))
	 (lengths (get-all-inverse-lengths lst prec))
	 (max-len (reduce #'max lengths)))
    ;;(format t "Debug: lengths = ~A, max = ~A~%" lengths max-len)
    (nth (position max-len lengths) lst)))

(defun sieve (prime list)
  (if (null list)
      (list prime)
      (cons prime (sieve (first list)
			 (remove-if #'(lambda (n)
					(= 0 (mod n prime)))
				    (rest list))))))

(defun eratosthenes (max-num)
  (let ((all-numbers (loop for i from 2 to max-num collect i)))
    (sieve (first all-numbers) (rest all-numbers))))
```

With this change, `(biggest-cycle 1000 1000)` yielded `499` (in _211 seconds+), but it turned out to be incorrect. `(biggest-cycle 1000 10000)` took _22810 seconds_, which is shameful, but yielded the right answer.
