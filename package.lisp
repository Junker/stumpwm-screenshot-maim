;;;; package.lisp

(defpackage :screenshot-maim
  (:use #:cl #:stumpwm)
  (:export #:*path*
           #:*format*
           #:*ask-filename*
           #:*delay*
           #:*hide-cursor*
           #:*quality*))
