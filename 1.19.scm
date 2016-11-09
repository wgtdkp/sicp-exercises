(load "expect.scm")

(define (fib n)
	(fib-iter 1 0 0 1 n))

(define (fib-iter a b p q n)
	(cond ((= n 0) b)
		  ((even? n) (fib-iter a
							   b
							   (+ (* p p) (* q q))
							   (+ (* 2 p q) (* q q))
							   (/ n 2)))
		  (else (fib-iter (+ (* b q) (* a q) (* a p))
						  (+ (* b p) (* a q))
  						  p
						  q
						  (- n 1)))))

; test
(expect 0 (fib 0))
(expect 1 (fib 1))
(expect 1 (fib 2))
(expect 2 (fib 3))
(expect 3 (fib 4))
(expect 5 (fib 5))
(expect 8 (fib 6))
