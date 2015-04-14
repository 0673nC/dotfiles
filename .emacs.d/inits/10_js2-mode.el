;;=====================================================================
;;          JavsScript - mode
;;=====================================================================

(require 'js2-mode)
(require 'auto-complete)
(require 'auto-complete-config)

(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))
(add-to-list 'ac-modes 'js2-mode)

(add-hook 'js2-mode-hook
  '(lambda ()
    (add-to-list 'ac-dictionary-files
                 "~/.emacs.d/ac-dict/js2-mode")
    (require 'js)
    (setq js-indent-level 2
          js-expr-indent-offset 2
          indent-tabs-mode nil)
    (defun my-js-indent-line ()
      (interactive)
      (let* ((parse-status (save-excursion (syntax-ppss (point-at-bol))))
             (offset (- (current-column) (current-indentation)))
             (indentation (js--proper-indentation parse-status)))
        (back-to-indentation)
        (if (looking-at "case\\s-")
            (indent-line-to (+ indentation 2))
          (js-indent-line))
        (when (> offset 0) (forward-char offset))))
    (set (make-local-variable 'indent-line-function) 'my-js-indent-line)
    (define-key js2-mode-map "\C-m" 'newline-and-indent)
    ))
