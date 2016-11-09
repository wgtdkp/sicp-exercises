(load "expect.scm")

(define (expt-iter a b n)
    (cond ((= n 0) a)
          ((even? n) (expt-iter a (* b b) (/ n 2)))
          (else (expt-iter (* a b) b (- n 1)))))

; test
(expect 9 (expt-iter 1 3 2))
(expect 27 (expt-iter 1 3 3))
(expect 81 (expt-iter 1 3 4))
