(load "expect.scm")
(define (fast-mul a b)
	(define (double x) (* x 2))
	(define (halve x) (/ x 2))
	(cond ((= b 0) 0)
		  ((even? b) (double (fast-mul a (halve b))))
		  (else (+ a (fast-mul a (- b 1))))))

; test
(expect 1 (fast-mul 1 1))
(expect 0 (fast-mul 0 2))
(expect 0 (fast-mul 2 0))
(expect 35 (fast-mul 5 7))
(expect 64 (fast-mul 8 8))
(expect 1024 (fast-mul 8 128))

