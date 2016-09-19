#lang racket

;;; Student Name: Joe Sutker
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

(define (assq key ass-list)
  (cond 
    [(empty? ass-list) key ]
    [(eq? key (first (first ass-list)))
      (second (first ass-list))]
    [else (assq key (rest ass-list))]
    )
  )

(define (calculate calc lookup-list)
  (display calc) (newline)
  (cond 
    [(list? calc) (cond
      [(equal? (first calc) 'ADD)
        (+ (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'MUL)
        (* (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'SUB)
        (- (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'DIV)
        (/ (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'GT)
        (> (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'LT)
        (< (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'GE)
        (>= (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'LE)
        (<= (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'EQ)
        (= (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'NEQ)
        (not 
          (= (calculate (second calc) lookup-list)
            (calculate (third calc) lookup-list)
            )
          )
        ]
      [(equal? (first calc) 'ANND)
        (and (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'ORR)
        (or (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'NOTT)
        (not (calculate (second calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'IPH)
        (if (calculate (second calc) lookup-list)
          (calculate (third calc) lookup-list)
          (calculate (fourth calc) lookup-list)
          )
        ]
      [(equal? (first calc) 'LAMBDA)
        calc
        ]
      [(list? (first calc))
        (cond
          [(= (length (first calc)) 3)
            (calculate (third (first calc)) (append (map (lambda (x y) (list x (calculate y lookup-list))) (second (first calc)) (rest calc)) lookup-list))]
          [(= (length (first calc)) 4)
            (display (append (map list (second (first calc)) (rest calc)) (fourth (first calc)))) (newline)
            (calculate (third (first calc)) (append (map list (second (first calc)) (rest calc)) (fourth (first calc))))]
          )
        ]
      )]
    [(symbol? calc) (calculate (assq calc lookup-list) lookup-list)]
    [else calc]
    )
  )

(define (repl env-list)
  (display "// ")
  (define (repl-helper inp mem-list)
    (define (def-list-first def-list)
      (list (first def-list) (second def-list) (third def-list))
      )
    (define (def-list-rest def-list)
      (append (list (first def-list)) (rest (rest (rest def-list))))
      )
    (cond
      [(list? inp) (cond
        [(and (= 3 (length inp)) (equal? (first inp) 'DEFINE))
          (append
            (filter 
              (lambda (var-name) 
                (not (equal? (second inp) (first var-name)))
                ) 
              mem-list
              )
            (list (if (list? (third inp))
              (if (not (eq? (first (third inp)) 'LAMBDA))
                (list (second inp) (calculate (third inp) mem-list))
                (list (second inp) (append (third inp) (list mem-list)))
                )
              (list (second inp) (calculate (third inp) mem-list))
              ))
            )
          ]
        [(equal? (first inp) 'DEFINE)
          (repl-helper (def-list-rest inp) (repl-helper (def-list-first inp) mem-list))
          ]
        [else (display (calculate inp mem-list)) (newline) mem-list]
        )]
      [else (display (calculate inp mem-list)) (newline) mem-list]
      )
    )
  (repl (repl-helper (read) env-list))
  )

(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish") (newline)
  (repl empty)
  )