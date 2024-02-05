(in-package :screenshot-maim)

(defparameter *path* "/var/tmp/") ; default save path. must be with a leading and trailing slash
(defparameter *format* "png")  ; if *ask-filename* is nil. Currently supports `png`, `jpg`, `bmp` and `webp`.
(defparameter *ask-filename* t)
(defparameter *delay* 0.2)
(defparameter *hide-cursor* nil)
(defparameter *quality* 10) ; An integer from 1 to 10 that determines the compression quality.


(defvar *filename-format* "screenshot-~d-~2,'0d-~2,'0d_~2,'0d-~2,'0d-~2,'0d")

(defun maim (args)
  (let ((filename (if *ask-filename*
                      (read-one-line (current-screen) "Filename: " :initial-input *path*)
                      (maim-gen-filename))))
    (when filename
      (stumpwm::unmap-message-window (current-screen))
      (multiple-value-bind (_ err-text err-code)
          (uiop:run-program (format nil "maim ~a --delay=~f --quality=~d ~a ~a"
                                    args
                                    *delay*
                                    *quality*
                                    (if *hide-cursor* "--hidecursor" "")
                                    filename)
                            :ignore-error-status t
                            :error-output '(:string :stripped t)
                            :output nil)
        (if (eq err-code 0)
            (message "Screenshotted to ~a" filename)
            (message err-text))))))


(defun maim-gen-filename ()
  (multiple-value-bind (second minute hour day month year)
	    (get-decoded-time)
    (concat
     *path*
     (format nil *filename-format* year month day hour minute second)
     "."
     *format*)))


(defcommand screenshot () ()
  "Make screenshot of root window"
  (maim ""))

(defcommand screenshot-area () ()
  "Make screenshot of selected area of display."
  (maim "--select "))

(defcommand screenshot-window () ()
  "Make screenshot of focus window"
  (maim "-i $(xdotool getactivewindow) "))
