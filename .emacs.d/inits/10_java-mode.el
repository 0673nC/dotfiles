;;================================================
;;; java-mode
;;================================================

;(require 'java-mode)
(setq auto-mode-alist
      (append '(("\\.java$" . java-mode)) auto-mode-alist))
(add-to-list 'ac-modes 'java-mode)

(add-hook 'java-mode-hook
          '(lambda ()
             ;; open - close function
             (hs-minor-mode 1)
             (define-key java-mode-map "\C-c\C-f" 'hs-toggle-hiding)
             ;; ;; flymake off
             ;; (flymake-mode-off)
             ))
