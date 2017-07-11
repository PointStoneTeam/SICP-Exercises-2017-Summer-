#lang scheme
(define x (list 1 3 (list 5 7) 9))
x
(cdr x)
(cddr x)
(caddr x)
(cdaddr x)
(car(cdaddr x))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define y (list  (list 7)))
y
(car y)
(caar y)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
z
(cdr z)
(cadr z)
(cdadr z)
(cadadr z)
(cdr (cadadr z))
(cadr (cadadr z))
(cdadr (cadadr z))
(cadadr (cadadr z))
(cdr (cadadr (cadadr z)))
(cadr (cadadr (cadadr z)))
(cdadr (cadadr (cadadr z)))
(cadadr (cadadr (cadadr z)))
