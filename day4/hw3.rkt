#lang racket

;;; Student Name: Joe Sutker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Gabe (explaining what 
;;;     results we were actually supposed to give, as it was unclear to me)

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.

(define (assq key ass-list)
  (cond 
    [(empty? ass-list) #f ]
    [(equal? key (first (first ass-list)))
      (second (first ass-list))]
    [else (assq key (rest ass-list))]
    )
  )

(assq 'thiskey '((thekey 13) (thiskey thisvalue) (theotherkey #t)))
(assq 'thatkey '((thekey 13) (thiskey thisvalue) (theotherkey #t)))

;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (calculate x lookup-list)
  (cond 
    [(list? x) (cond
      [(equal? (first x) 'ADD)
        (+ (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'MUL)
        (* (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'SUB)
        (- (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'DIV)
        (/ (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'GT)
        (> (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'LT)
        (< (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'GE)
        (>= (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'LE)
        (<= (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'EQ)
        (= (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'NEQ)
        (not 
          (= (calculate (second x) lookup-list)
            (calculate (third x) lookup-list)
            )
          )
        ]
      [(equal? (first x) 'ANND)
        (and (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'ORR)
        (or (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          )
        ]
      [(equal? (first x) 'NOTT)
        (not (calculate (second x) lookup-list)
          )
        ]
      [(equal? (first x) 'IPH)
        (if (calculate (second x) lookup-list)
          (calculate (third x) lookup-list)
          (calculate (fourth x) lookup-list)
          )
        ]
      )]
    [(symbol? x) (assq x lookup-list)]
    [else x]
    )
  )

(define var-list '((x 3) (y 2)))
(calculate '(ADD x y) var-list) ;; --> 5