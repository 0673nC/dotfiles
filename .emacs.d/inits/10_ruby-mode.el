;;================================================
;;; ruby-mode
;;================================================

(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)

(setq auto-mode-alist
      (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))

(add-to-list 'ac-modes 'ruby-mode)

(add-hook 'ruby-mode-hook
          '(lambda () 
             ;; open - close function
             (hs-minor-mode 1)
             ))

(let ((ruby-mode-hs-info
       '(ruby-mode
          "class\\|module\\|def\\|if\\|unless\\|case\\|while\\|until\\|for\\|begin\\|do"
          "end"
          "#"
          ruby-move-to-block
          nil)))
  (if (not (member ruby-mode-hs-info hs-special-modes-alist))
      (setq hs-special-modes-alist
            (cons ruby-mode-hs-info hs-special-modes-alist))))

(setq ruby-electric-expand-delimiters-list nil)

;;; ruby-block.el --- highlight matching block
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)
