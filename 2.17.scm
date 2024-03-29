(load "expect.scm")

(define (last-pair li)
    (if (null? (cdr li))
        li
        (last-pair (cdr li))))

; test
(expect (list 1) (last-pair (list 1)))
(expect (list 3) (last-pair (list 1 2 3)))
