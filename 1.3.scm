(load "expect.scm")

(define (sum_max2 a b c)
    (if (> a c)
        (if (> b c) (+ a b) (+ a c))
        (if (> b a) (+ c b) (+ a c))
    )
)

; test
(expect 5 (sum_max2 1 2 3))
(expect 17 (sum_max2 10 5 7))
(expect 134 (sum_max2 6 100 34))
