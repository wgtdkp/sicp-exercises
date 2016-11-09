(load "expect.scm")

; iterative
(define (reverse-iter li)
    (define (helper li rev)
        (if (null? li)
            rev
            (helper (cdr li) (cons (car li) rev))))
    (helper li ()))

; test
(expect (list 1) (reverse-iter (list 1)))
(expect (list 5 4 3 2 1) (reverse-iter (list 1 2 3 4 5)))
(display (reverse-recur (list 1 2 3 4 5)))
