(load "expect.scm")
(load "map.scm")

(define (square-list li)
    (map (lambda (x) (display x) (* x x)) li))

; test
(expect (list 1 4 9 16) (square-list (list 1 2 3 4)))
