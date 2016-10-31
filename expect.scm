(load-option 'format)

(define (!= a b)
    (not (= a b))
)

(define (expect expected val)
    (if (!= expected val)
        (format #t "###### error: ~A != ~A" expected val)
    )
)

(define (expect-true val)
    (if (not val)
        (format #t "###### error: #t != ~A" val)
    )
)

(define (expect-false val)
    (if val
        (format #t "###### error: #f != ~A" val)
    )
)
