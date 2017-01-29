;;===============================================
;;; git setteing
;;==============================================

(require 'magit)
(defalias 'gs 'magit-status)

(add-to-list 'with-editor-server-window-alist
             (cons git-commit-filename-regexp 'switch-to-buffer))

(package-initialize) ; otherwise Emacs doesn't know were to find it
(setq package-initialize-at-startup nil) ; don't do it again
(global-git-commit-mode)

(global-git-gutter-mode t)

(set-face-foreground 'magit-diff-added "#00FF00")
(set-face-background 'magit-diff-added "Black")
(set-face-foreground 'magit-diff-added-highlight "#00FF00")
(set-face-background 'magit-diff-added-highlight "Black")
(set-face-foreground 'magit-diff-removed "#FF0000")
(set-face-background 'magit-diff-removed "Black")
(set-face-foreground 'magit-diff-removed-highlight "#FF0000")
(set-face-background 'magit-diff-removed-highlight "Black")
(set-face-background 'magit-diff-lines-boundary "blue")

;; 文字の折り返し無効
(add-hook 'git-commit-mode-hook (setq auto-fill-mode nil))
