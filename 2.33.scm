(load "expect.scm")
(load "accumulate.scm")

(define (map op seq)
	(accumulate (lambda (x y) (cons (op x) y)) () seq))

(define (append seq1 seq2)
	(accumulate cons seq2 seq1))

(define (len seq)
	(accumulate (lambda (x y) (+ 1 y)) 0 seq))

; test
(define op (lambda (x) (* x x)))
(expect () (map op ()))
(expect (list 4) (map op (list 2)))
(expect (list 1 4 9 16) (map op (list 1 2 3 4)))

; test append
(expect () (append () ()))
(expect (list 1) (append () (list 1)))
(expect (list 1) (append (list 1) ()))
(expect (list 1 2 3 4) (append (list 1 2) (list 3 4)))

; test len
(expect 0 (len ()))
(expect 1 (len (list 1)))
(expect 5 (len (list 1 2 3 4 5)))

