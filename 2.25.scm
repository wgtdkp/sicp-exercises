(load "expect.scm")

; test
(define a (list 1 3 (list 5 7) 9))
(define b (list (list 7)))
(define c (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(expect 7 (car (cdr (car (cdr (cdr a))))))
(expect 7 (car (car b)))
(expect 7 (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr c)))))))))))))

