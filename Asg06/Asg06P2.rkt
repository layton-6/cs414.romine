;; William Romine
;; 00103649
;; Dr. Lewis CS414

;; https://docs.racket-lang.org/guide/to-scheme.html

#lang racket

(define (tokenize command-string)
  (define word-list (string-split command-string))

  (define (process-word word tokens)
    (cond
      [(equal? word "ls") (cons 'LS tokens)]
      [(equal? word "cd") (cons 'CD tokens)]
      [(equal? word "cat") (cons 'CAT tokens)]
      [(equal? word "print") (cons 'PRINT tokens)]
      [(equal? word "exec") (cons 'EXEC tokens)]
      [(regexp-match? #rx"^[a-zA-Z]{1,8}\\.[a-zA-Z]{1,3}$" word)
       (cons (list 'FILENAME word) tokens)]
      [(regexp-match? #rx"^\\\\?[a-zA-Z]{1,8}$" word)
       (cons (list 'FOLDER word) tokens)]
      [else (error "Unrecognized token: " word)]))

  ;; Use foldl to apply `process-word`
  (reverse (foldl process-word '() word-list)))

;; Example
(define test-command "cd \\folder1")
(define tokens (tokenize test-command))
(display tokens)  ;; Output: (CD (FOLDER "\\folder1"))

