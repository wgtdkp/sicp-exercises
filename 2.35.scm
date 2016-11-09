(load "expect.scm")
(load "accumulate.scm")

(define (count-leaves t)
	(accumulate (lambda (x y) (if (not (pair? x))
								  (+ 1 y)
								  (+ (count-leaves x) y)))
				0
				t))

; test
(expect 0 (count-leaves ()))
(expect 1 (count-leaves (list 1)))
(expect 3 (count-leaves (list 1 2 3)))
(expect 4 (count-leaves (list (list 1 2) (list 3 4))))

