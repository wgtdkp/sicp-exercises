(load "expect.scm")

(define (fringe t)
	(cond ((null? t) ())
		  ((not (pair? t)) (list t))
		  (else (append (fringe (car t)) (fringe (cdr t))))))

; test
(expect () (fringe ()))
(expect (list 1) (fringe (list 1)))
(expect (list 1 2 3 4) (fringe (list 1 2 3 4)))
(define x (list (list 1 2) (list 3 4)))
(expect (list 1 2 3 4) (fringe x))
(expect (list 1 2 3 4 1 2 3 4) (fringe (list x x)))

