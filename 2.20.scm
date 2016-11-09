(load "expect.scm")

(define (same-parity x . y)
    (define (sa? a b) (even? (- a b)))
    (define (helper x li)
        (cond ((null? li) ())
            ((sa? x (car li))
            (cons (car li) (helper x (cdr li))))
            (else (helper x (cdr li)))))
    (helper x y))

; test
(expect (list 2 4 6) (same-parity 2 1 2 3 4 5 6))
(expect (list 1 3 5) (same-parity 1 1 2 3 4 5 6))
