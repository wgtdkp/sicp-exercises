(load "expect.scm")
(load "accumulate.scm")

(define (horner x coeff)
    (accumulate (lambda (a b) (+ a (* x b)))  0 coeff))

; test
(expect 0 (horner 10 ()))
(expect 10 (horner 0 (list 10 0)))
(expect 15 (horner 1 (list 1 2 3 4 5)))
(expect 31 (horner 2 (list 1 1 1 1 1)))
