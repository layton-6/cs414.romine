;; William Romine
;; 00103649
;; Dr. Lewis CS414

;; I used Racket Essentials Article: https://docs.racket-lang.org/guide/to-scheme.html

#lang racket

;; 1. Atoms: I chose Soda Brand Names
(define soda1 'coke)
(define soda2 'pepsi)
(define soda3 'sprite)
(define soda4 'fanta)
(define soda5 'drpepper)

;; 10 Different Lists with Soda Name Brands
(define coke-pepsi-sprite (cons 'coke (cons 'pepsi (cons 'sprite '()))))
(define pepsi-coke-drpepper (cons 'pepsi (cons 'coke (cons 'drpepper '()))))
(define sprite-fanta-pepsi (cons 'sprite (cons 'fanta (cons 'pepsi '()))))
(define coke-drpepper-fanta (cons 'coke (cons 'drpepper (cons 'fanta '()))))
(define pepsi-sprite-coke (cons 'pepsi (cons 'sprite (cons 'coke '()))))
(define drpepper-coke-pepsi (cons 'drpepper (cons 'coke (cons 'pepsi '()))))
(define fanta-pepsi-sprite (cons 'fanta (cons 'pepsi (cons 'sprite '()))))
(define pepsi-coke-sprite (cons 'pepsi (cons 'coke (cons 'sprite '()))))
(define drpepper-sprite-pepsi (cons 'drpepper (cons 'sprite (cons 'pepsi '()))))
(define fanta-drpepper-coke (cons 'fanta (cons 'drpepper (cons 'coke '()))))

;; 2. Construct the following lists:
;; (all (these problems)) 
(define all-these-problems (cons 'all (cons (cons 'these (cons 'problems '())) '())))
;; (all (these) problems) 
(define all-these-problems-alt (cons 'all (cons (cons 'these '()) (cons 'problems '()))))
;; ((all these) problems) 
(define all-these-nested (cons (cons 'all (cons 'these '())) (cons 'problems '())))
;; ((all these problems)) 
(define all-these-problems-deep (cons (cons 'all (cons 'these (cons 'problems '()))) '()))

;; 3. (car (cons a l)) where a is 'french and l is '(fries)
(define french-fries-test (car (cons 'french '(fries)))) ;; 'french

;; 4. Is there a list that makes (null? (cons a l)) true?
;; No, it's always false.

;; 5. Which expressions return true?
(define (atom? x)
  (and (not (pair? x)) (not (null? x))))

(define atom-test (atom? (car '((meatballs) and spaghetti)))) ;; Returns False
(define null-test (null? (cdr '((meatballs))))) ;; Returns True
(define eq-test (eq? (car '(two meatballs)) (car (cdr '(two meatballs))))) ;; Returns False

;; 6. Rewrite the expression using `if`
(define (member? a lst)
  (cond
    ((null? lst) #f)
    ((eq? a (car lst)) #t)
    (else (member? a (cdr lst)))))

(define (member-or-equal l a)
  (if (null? l)
      '()
      (or (eq? (car l) a)
          (member? a (cdr l)))))

;; 7. 'nonlat?' function that checks if a list does not contain atomic S-expressions
(define (nonlat? lst)
  (cond
    ((null? lst) #t)
    ((atom? (car lst)) #f)
    (else (and (nonlat? (car lst)) (nonlat? (cdr lst))))))

;; 8. 'member-twice?' function to check if an atom appears twice
(define (member-twice? a lat)
  (cond
    ((null? lat) #f)
    ((eq? a (car lat)) (if (member? a (cdr lat)) #t #f))
    (else (member-twice? a (cdr lat)))))

;; 9. 'seconds' function to extract the second atom from each list
(define (seconds lst)
  (map (lambda (lat) (cadr lat)) lst))

;; Testing seconds function
(define soda-lists '((coke pepsi sprite) (fanta drpepper) (7up mountain-dew sierra-mist)))

;; Print results of tests
(displayln (string-append "French Fries test: " (symbol->string french-fries-test))) ;; Returns 'french
(displayln (string-append "Atom Test: " (format "~a" atom-test))) ;; Returns False
(displayln (string-append "Null Test: " (format "~a" null-test))) ;; Returns True
(displayln (string-append "Eq Test: " (format "~a" eq-test))) ;; Returns False
(displayln (string-append "Seconds Test: " (format "~a" (seconds soda-lists)))) ;; Returns '(pepsi drpepper mountain-dew)

