(load "expect.scm")
(load "2.38.scm")

(define (reverse-fr seq)
	(fold-right (lambda (x y) (append y (list x))) () seq))

(define (reverse-fl seq)
	(fold-left (lambda (x y) (cons y x)) () seq))

; test
(expect () (reverse-fr ()))
(expect (list 1) (reverse-fr (list 1)))
(expect (list 1 2 3 4) (reverse-fr (list 4 3 2 1)))

(expect () (reverse-fl ()))
(expect (list 1) (reverse-fl (list 1)))
(expect (list 1 2 3 4) (reverse-fl (list 4 3 2 1)))

