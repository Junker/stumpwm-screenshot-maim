;;;; pamixer.asd

(asdf:defsystem #:screenshot-maim
  :description "Screenshot module for StumpWM"
  :author "Dmitrii Kosenkov"
  :license  "GPLv3"
  :version "0.1.0"
  :serial t
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "screenshot-maim")))
