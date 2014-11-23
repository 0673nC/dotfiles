;=================================================
;;c-mode c++-mode setting
;=================================================

;;(require 'ldefs-boot)
(require 'loaddefs)
(add-hook 'c-mode-common-hook
          '(lambda ()
             ;;enter enter-key auto \n+indent
             (define-key c-mode-base-map "\C-m" 'newline-and-indent)
             (define-key c-mode-base-map "\C-c\C-l" 'toggle-truncate-lines)
             ;;auto indent off
             (setq c-auto-newline nil)
             ;;flyspell-prog-mode on
             ;;(flyspell-prog-mode)
             ;;cc-mode
             (c-set-style "cc-mode")
             (flymake-mode t)
             ;;space all delete
             (c-toggle-hungry-state 1)
             ;;競プロっぽいインデント
             (c-set-offset 'substatement 0)
             ;; open - close function
             (hs-minor-mode 1)
             ))
