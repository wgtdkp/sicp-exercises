(load "expect.scm")

(define x (list 1 2 3))
(define y (list 4 5 6))

(expect (list 1 2 3 4 5 6) (append x y))
(expect (list (list 1 2 3) 4 5 6) (cons x y))
(expect (list (list 1 2 3) (list 4 5 6)) (list x y))

