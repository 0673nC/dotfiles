;;================================================
;;;     Look
;;================================================

;;delete default message
(setq inhibit-startup-message t)

;;delete menu bar
(menu-bar-mode -1)

;;delete tool bar
(tool-bar-mode -1)

;;delete default scroll bar
(scroll-bar-mode 0)

;;add yascroll bar
(global-yascroll-bar-mode 1)

;;back ground color
(set-background-color "Black")

;;cursor color
(set-cursor-color "Green")

;;stop cursor blinking
(blink-cursor-mode 0)

;;character color
(set-foreground-color "White")

;;color of th choice range
(setq transient-mark-mode t)

;;background see-through
(set-frame-parameter nil 'alpha 85)

;;cursor line highlight
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "dark slate gray"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode t)
;;cursor underline
;(setq hl-line-face 'underline)

;; uniq filename
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
