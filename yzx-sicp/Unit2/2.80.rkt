#lang scheme
 (define (=zero? data) 
   (cond 
    ((number? data) (= data 0)) 
    ((eq? 'rational (type-tag data)) 
     (=zero? (contents data))) 
    ((eq? 'complex (type-tag data)) 
     (and (=zero? (real-part data)) 
          (=zero? (imag-part data)))) 
    (else (error "xxx")))) 
