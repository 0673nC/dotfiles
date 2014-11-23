;;================================================
;;;     Shell
;;================================================

;;always hokan
(icomplete-mode 1)

;;history hokan up down shell-mode
(add-hook 'shell-mode-hook
    (function (lambda ()
         (define-key shell-mode-map [up] 'comint-previous-input)
          (define-key shell-mode-map [down] 'comint-next-input))))



;; shell-pop
; shell-pop の設定
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)
(shell-pop-set-internal-mode "ansi-term")
(shell-pop-set-internal-mode-shell "/bin/zsh")
(shell-pop-set-window-height 60)
