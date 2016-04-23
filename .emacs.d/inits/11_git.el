;;===============================================
;;; git setteing
;;==============================================

(require 'magit)
(setq magit-last-seen-setup-instructions "1.4.0")

(defalias 'gs 'magit-status)

(global-git-gutter-mode t)

;; 文字色変更
(set-face-foreground 'magit-diff-add "#00FF00")
(set-face-foreground 'magit-diff-del "#FF0000")
(set-face-foreground 'magit-diff-file-header "#00FFFF")
(set-face-foreground 'magit-diff-hunk-header "#00AADD")
(set-face-foreground 'magit-section-title "#FF00FF")

;; 背景色変更
(set-face-background 'magit-item-highlight "Black")
(set-face-background 'magit-diff-add "Black")
(set-face-background 'magit-diff-del "Black")
(set-face-background 'magit-diff-file-header "Black")
(set-face-background 'magit-diff-hunk-header "Black")
(set-face-background 'magit-section-title "Black")
