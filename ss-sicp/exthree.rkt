#lang scheme
(define (sos  a b c )
  (cond ( (and(> a c)(> b c))(+ a b))
((and(> b a)(> c a))(+ b c))
((and(> a b)(> c b))(+ c a))))