;;================================================
;;;    other emacs setting
;;================================================

;;tab width 4, tab = space
(setq-default tab-width 4 indent-tabs-mode nil)

;;disable auto save
(setq auto-save-default nil)
(setq make-backup-files nil)
(setq auto-save-list-file-prefix nil)

;;able auto indent
(setq c-auto-newline t)

;;search highlight
(setq search-highlight t)

;;case arc() highlight
(show-paren-mode t)

;;char number of the line
(column-number-mode t)

;;now line number
(line-number-mode t)
(require 'linum)
(global-linum-mode)

;;over char window-width
;;(setq-default auto-fill-mode t)
;(setq truncate-partial-width-windows t)
(defun toggle-truncate-lines ()
  "truncate-line on."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key "\C-c\C-l" 'toggle-truncate-lines)
;;(setq truncate-lines t)

;;file name at title
(setq frame-title-format (format "emacs@%s : %%f" (system-name)))

;;short question
(fset 'yes-or-no-p 'y-or-n-p)

;;char code
;(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
;(set-terminal-coding-system    'utf-8-unix)
;(set-buffer-file-coding-system 'utf-8-unix)
;(set-keyboard-coding-system    'utf-8-unix)

;;cua-mode
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; auto-revert-buffer
(global-auto-revert-mode 1)
