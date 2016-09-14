#lang racket

;; 0. Factorial:

(define (factorial n)
  (cond
    [(= n 1) 1]
    [else (* n (factorial (- n 1)))]
    )
  )

(define (tail-factorial n)
  (define (tail-help total counter)
    (if (= counter 1)
      total
      (tail-help (* counter total) (- counter 1))
      )
    )
  (tail-help 1 n)
  )

; (factorial 10000)
; (tail-factorial 30000)

;; 1. Filter:

(define (my-filter fxn lst)
  (define (filter-help funx thelst devlst)
    (cond
      [(empty? thelst) devlst]
      [(funx (first thelst)) 
        (filter-help funx (rest thelst) (append devlst (list (first thelst))))
        ]
      [else (filter-help funx (rest thelst) devlst)]
      )
    )
  (filter-help fxn lst empty)
  )

; (my-filter even? '(1 2 3 4 5 6 7 8 9))

;; 2. Map:

(define (square x) (* x x))

(define (my-map fxn lst)
  (define (map-help funx thelst devlst)
    (cond
      [(empty? thelst) devlst]
      [else
        (map-help funx (rest thelst) (append devlst (list (fxn (first thelst)))))
        ]
      )
    )
  (map-help fxn lst empty)
  )

; (my-map square '(1 2 3 4 5 6 7 8 9))

;; 3. Append

(define (my-append lst1 lst2)
  (define (app-help lst1 lst2 devlst) 
    )
  )
