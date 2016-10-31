(define (map proc li)
    (if (null? li)
        ()
        (cons (proc (car li)) (map proc (cdr li)))))
