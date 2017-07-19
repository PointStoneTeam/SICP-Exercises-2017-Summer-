#lang scheme
(define (below painter1 painter2)
    (let ((split-point (make-vect 0.0 0.5)))
        (let ((paint-top
                (transform-painter painter2
                                   split-point
                                   (make-vect 1.0 0.5)
                                   (make-vect 0.0 1.0)))
              (paint-down
                (transform-painter painter1
                                   (make-vect 0.0 0.0)
                                   (make-vect 1.0 0.0)
                                   split-point)))
            (lambda (frame)
                (paint-top frame)
                (paint-down frame)))))


(define (below painter1 painter2)
    (lambda (frame)
        ((flip-horiz
            (rotate90
                (beside
                    (rotate270
                        (flip-horiz painter1))
                    (rotate270
                        (flip-horiz painter2)))))
         frame)))


