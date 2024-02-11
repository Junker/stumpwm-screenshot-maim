;;;; package.lisp

(defpackage :screenshot-maim
  (:use #:cl #:stumpwm)
  (:export #:*path*
           #:*format*
           #:*ask-filename*
           #:*save-to-clipboard*
           #:*xclip-selection*
           #:*delay*
           #:*hide-cursor*
           #:*quality*))
