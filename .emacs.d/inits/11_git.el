;;===============================================
;;; git setteing
;;==============================================

(require 'magit)
(defalias 'gs 'magit-status)

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
