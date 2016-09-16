#lang racket

(define (list-length xs)
  (for/sum ([i (map (lambda (x) 1) xs)]) i)
  )

(display (list-length '())) (newline)
(display (list-length '(a))) (newline)
(display (list-length '(a b))) (newline)
(display (list-length '(a b a b))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (count-evens xs)
  (list-length (filter even? xs))
  )

(display (count-evens '())) (newline)
(display (count-evens '(1))) (newline)
(display (count-evens '(1 2 3))) (newline)
(display (count-evens '(1 4 9 10 12))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-square xs)
  (map (lambda (x) (* x x)) xs)
  )

(display (list-square '(1 2 3))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-add1 lst)
  (map (lambda (x) (+ 1 x)) lst)
  )

(display (list-add1 '(1 2 3))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-add10 lst)
  (map (lambda (x) (+ 10 x)) lst)
  )

(display (list-add10 '(1 2 3))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (list-addn n lst)
  (map (lambda (x) (+ n x)) lst)
  )

(display (list-addn 10 '(1 2 3))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filter-even lst)
  (filter even? lst)
  )

(display (filter-even '(1 2 3 5 8 13 21 34))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filter-positive lst)
  (filter (lambda (x) (> x 0)) lst)
  )

(display (filter-positive '(1 2 -3 -4 5 -6 7))) (newline)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (filter-gt lower lst)
  (filter (lambda (x) (>= x lower)) lst)
  )

(display (filter-gt 3 '(1 2 -3 -4 5 -6 7))) (newline)
