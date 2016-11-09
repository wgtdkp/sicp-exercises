(load "expect.scm")
(load "accumulate.scm")

(define (accumulate-n op init seqs)
	(if (null? (car seqs))
		()
		(cons (accumulate op
						  init
						  (accumulate (lambda (x y) (cons (car x) y)) () seqs))
			  (accumulate-n op
							init
							(accumulate (lambda (x y) (cons (cdr x) y)) () seqs)))))

; test
(define s (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
(expect (list 22 26 30) (accumulate-n + 0 s))

