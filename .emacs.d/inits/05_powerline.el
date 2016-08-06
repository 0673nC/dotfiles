;;================================================
;;;   powerline
;;================================================
(require 'powerline)
(powerline-center-theme)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#00008b"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fff"
                    :background "#6495ed"
                    :inherit 'mode-line)

;; (set-face-attribute 'powerline-active2 nil
;;                     :foreground "#000"
;;                     :background "#00ffff"
;;                     :inherit 'mode-line)
