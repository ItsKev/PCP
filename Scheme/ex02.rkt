;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname ex02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
(define (fib n)
  (local (
    (define (fib-local x current previous)
      (cond
        [(equal? x n) current]
        [else (fib-local (+ x 1) (+ current previous) current)])))
  (fib-local 0 0 1)))