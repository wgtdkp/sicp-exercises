(load "expect.scm")
(load "sum.scm")

(define (simpson1 f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (/ (* h 
          (sum (lambda (k) (+ (y k) (* 4 (y (+ k 1))) (y (+ k 2)))) 
               0
               (lambda (x) (+ x 2))
               (- n 2)))
       3))

(define (simpson f a b n)
    (define h (/ (- b a) n))
    (define (y k) (f (+ a (* k h))))
    (/ (* h ( + (sum (lambda (k) (+ (* 4 (y k)) (* 2 (y (+ k 1)))))
                     1
                     (lambda (x) (+ x 2))
                     (- n 1))
                (y 0)
                (- (y n))))
       3))


; test
; simpson 公式具有三次代数精度，因此这里得到的值是无误差的
(expect (/ 1 4) (simpson1 (lambda (x) (* x x x)) 0 1 100))
(expect (/ 1 4) (simpson1 (lambda (x) (* x x x)) 0 1 1000))
(expect (/ 1 4) (simpson (lambda (x) (* x x x)) 0 1 100))
(expect (/ 1 4) (simpson (lambda (x) (* x x x)) 0 1 1000))