(load "expect.scm")

(define (reverse x)
    (define (iter x res)
        (cond ((null? x) res)
              ((not (pair? x)) x)
              (else (iter (cdr x) (cons (iter (car x) ()) res)))))
    (iter x ()))

; test
(expect () (reverse ()))
(expect (list 1) (reverse (list 1)))
(expect (list (list 1)) (reverse (list (list 1))))
(expect (list 1 2 3 4) (reverse (list 4 3 2 1)))
(expect (list (list 1 2) (list 3 4)) (reverse (list (list 4 3) (list 2 1))))

