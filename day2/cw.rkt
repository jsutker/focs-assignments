#lang racket

(define (tree-add1 tree)
	(cond
    [(empty? tree) tree]
    [(number? (first tree)) (cons (+ 1 (first tree)) (tree-add1 (rest tree)))]
    [else (cons (tree-add1 (first tree)) (tree-add1 (rest tree)))]
    )
  )

(display (tree-add1 '(3 ( 1 4)))) (newline)
(display (tree-add1 '(3))) (newline)
(display (tree-add1 '())) (newline)