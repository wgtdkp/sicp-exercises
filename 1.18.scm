(load "expect.scm")
(define (fast-mul a b)
    (define (double x) (* x 2))
    (define (halve x) (/ x 2))
    (define (iter a b res)
        (cond ((= b 0) res)
               ((even? b) (iter (double a) (halve b) res))
              (else (iter a (- b 1) (+ res a)))))
    (iter a b 0))

; test
(expect 1 (fast-mul 1 1))
(expect 0 (fast-mul 1 0))
(expect 0 (fast-mul 0 1))
(expect 35 (fast-mul 7 5))
(expect 64 (fast-mul 8 8))
(expect 1024 (fast-mul 8 128))

