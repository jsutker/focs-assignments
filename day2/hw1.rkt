#lang racket

;;; Student Name: Joe Sutker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Danny Wolf (he convinced me to actually format nicely)
;;;     and/or using these external resources: https://docs.racket-lang.org/reference/if.html
;;;     and/or using these external resources: https://docs.racket-lang.org/guide/Lists__Iteration__and_Recursion.html

;;     NOTE:  You need not worry about error checking in the programs below.

;; 1.  WRITE SQUARE:  given n, returns n^2.  Hint:  use *
(define (square x)
  (* x x))
  
(display (square 2)) (newline)  ;; -> 4

;; 2.  WRITE is-right-triangle:  given three numbers, returns true iff the third
;;     could be the hypotenuse of a right triangle with the specified three side lengths
;;     Hint:  use = to compare numeric values

(define (is-right-triangle x y z)
  (or (= (* x x) (+ (* z z) (* y y))) 
  	(or (= (* z z) (+ (* x x) (* y y))) 
  		(= (* y y) (+ (* x x) (* z z)))
  		)
  	)
  )
  
(display (is-right-triangle 3 4 5)) (newline)  ;; -> #t
(display (is-right-triangle 4 5 6)) (newline)  ;; -> #f

;; 3.  WRITE FACTORIAL:  given n, returns n!
;;     Hint:  recursion is your friend
(define (fact n)
  (if (= 1 n) 
    1 
    (* n 
      (fact (- n 1))
      )
    )
  )

(display (fact 1)) (newline) ;; -> 1
(display (fact 2)) (newline) ;; -> 2
(display (fact 3)) (newline) ;; -> 6

;; 4.  WRITE FIBONACCI:  given n, returns the nth fibonacci number as shown below
;;     Hint:  don't run this on really big numbers!
(define (fib n)
  (if (positive? n) 
    (if (= n 1) 
      1 
      (+ (fib (- n 1)) 
        (fib (- n 2))
        )
      ) 
    0 
    )
  )

(display (fib 1)) (newline) ;; -> 1
(display (fib 2)) (newline) ;; -> 1
(display (fib 3)) (newline) ;; -> 2
(display (fib 4)) (newline) ;; -> 3
(display (fib 5)) (newline) ;; -> 5
(display (fib 6)) (newline) ;; -> 8

;; 5.  WRITE a procedure that takes a list of numbers and returns the sum of those numbers
;;     Hint:  first, rest, cons
(define (sum lst)
  (if (= 1 (length lst)) 
    (first lst) 
    (+ (first lst) (sum (rest lst)))
    ) 
  )

(display (sum '(1 2 3 4))) (newline) ;; -> 10
(display (sum '(1 20 300))) (newline) ;; -> 321

;; 6.  WRITE a procedure that takes a list of numbers and returns the largest one.
;;     While there are solutions using scheme's built-in max, we were actually hoping you'd do something else...
(define (my-max lst)
  (define (running-max lst the-max)
  	(if (empty? lst)
  		the-max
	  	(if (> (first lst) the-max) 
	  		(running-max (rest lst) (first lst)) 
	  		(running-max (rest lst) the-max)
	  		)
	  	)
  	)
  (running-max (rest lst) (first lst))
  )

(display (my-max '(1 10 2 20 3))) (newline) ;; -> 20
