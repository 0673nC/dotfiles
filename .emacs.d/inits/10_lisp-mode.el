;;================================================
;;;     lisp-mode
;;================================================

;; Clozure CLをデフォルトのCommon Lisp処理系に設定
(setq inferior-lisp-program "/usr/local/bin/clisp")
;; SLIMEのロード
(require 'slime)
(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))

;; SLIMEからの入力をUTF-8に設定
(setq slime-net-coding-system 'utf-8-unix)

;; Apropos
(push '("*slime-apropos*") popwin:special-display-config)
;; Macroexpand
(push '("*slime-macroexpansion*") popwin:special-display-config)
;; Help
(push '("*slime-description*") popwin:special-display-config)
;; Compilation
(push '("*slime-compilation*" :noselect t) popwin:special-display-config)
;; Cross-reference
(push '("*slime-xref*") popwin:special-display-config)
;; Debugger
(push '(sldb-mode :stick t) popwin:special-display-config)
;; REPL
(push '(slime-repl-mode) popwin:special-display-config)
;; Connections
(push '(slime-connection-list-mode) popwin:special-display-config)

;; slime auto-compleate
(require 'ac-slime)
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; SLIME quit
(defun slime-smart-quit ()
  (interactive)
  (when (slime-connected-p)
    (if (equal (slime-machine-instance) "my.workstation")
      (slime-quit-lisp)
      (slime-disconnect)))
  (slime-kill-all-buffers))
(add-hook 'kill-emacs-hook 'slime-smart-quit)
