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
(require 'shell-pop)
(global-set-key [f8] 'shell-pop)
(custom-set-variables
 ;; '(shell-pop-default-directory "~/")
 '(shell-pop-shell-type (quote ("ansi-term" "*ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
 '(shell-pop-term-shell "/bin/zsh")
 '(shell-pop-universal-key "C-c t")
 '(shell-pop-window-height 30)
 '(shell-pop-full-span t)
 '(shell-pop-window-position "bottom"))
