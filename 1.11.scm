(load "expect.scm")

(define (f n)
    (if (< n 3)
        n
        (+ (f (- n 1))
           (* 2 (f (- n 2)))
           (* 3 (f (- n 3))))))

(define (ff n)
    (define (ff-iter n a b c)
        (if (= n 0)
            c
            (ff-iter (- n 1) (+ a (* 2 b) (* 3 c)) a b)))
    (ff-iter n 2 1 0))


; // test
(expect 0 (f 0))
(expect 1 (f 1))
(expect 2 (f 2))
(expect 4 (f 3))
(expect 11 (f 4))
(expect 25 (f 5))

(expect 0 (ff 0))
(expect 1 (ff 1))
(expect 2 (ff 2))
(expect 4 (ff 3))
(expect 11 (ff 4))
(expect 25 (ff 5))

