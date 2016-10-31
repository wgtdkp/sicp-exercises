(load "expect.scm")

(define (subt x)
    (define (subt-iter last-guess guess)
        (if (good-enough? last-guess guess)
            guess
            (subt-iter guess (improve guess))
        )
    )

    (define (improve y)
        (/ (+ (/ x (* y y)) (* 2 y)) 3)
    )

    (define (good-enough? last-guess guess)
        (< (abs (- last-guess guess)) 0.001)
    )

    (define (abs v)
        ((if (> v 0) + -) v)
    )
    
    (subt-iter 0.0 1.0)
)


; test
(expect 4 (abs -4))
(expect 0 (abs 0))
(expect 4 (abs 4))

(display (subt 27))
(newline)
(display (subt 64))
(newline)
(display (subt 216))
(newline)
