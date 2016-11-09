(load "expect.scm")
(load "accumulate.scm")

(define (dot-product v w)
    (accumulate + 0 (map * v w)))

;(define (matrix-*-vector m v)
; 	(map (lambda (x) (accumulate + 0 (map * x v))) m))

(define (matrix-*-vector m v)
    (map (lambda (x) (dot-product x v)) m))

(define (transpose mat)
    (accumulate-n cons () mat))

(define (matrix-*-matrix m n)
    (let ((cols (transpose n)))
        (map (lambda (x) (map (lambda (y) (dot-product x y)) cols)) m)))

; test
(define v (list 1 2 3))
(define w (list 4 5 6))
(define m (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
(define n (list (list 1 1 1) (list 2 2 2) (list 3 3 3)))
(expect 32 (dot-product v w))
(expect (list 14 32 50) (matrix-*-vector m v))
(expect (list (list 1 4 7) (list 2 5 8) (list 3 6 9)) (transpose m))
(expect (list (list 14 14 14) (list 32 32 32) (list 50 50 50)) (matrix-*-matrix m n))

