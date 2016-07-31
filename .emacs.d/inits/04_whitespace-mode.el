;;==============================================
;;; white space
;;==============================================
(require 'whitespace)
(setq whitespace-style '(face
                         trailing
                         tabs
                         spaces
                         empty
                         space-mark
                         tab-mark
                         ))

(setq whitespace-display-mappings
      '((space-mark ?\u3000 [?\u25a1])
        (tab-mark ?\t [?\u00BB ?\t] [?\\ ?\t])))

(setq whitespace-space-regexp "\\(\u3000+\\)")
(setq whitespace-action '(auto-cleanup))

(global-whitespace-mode 1)


(set-face-attribute 'whitespace-trailing nil
                    :background "Black"
                    :foreground "DeepPink"
                    :underline t)
(set-face-attribute 'whitespace-tab nil
                    :background "Black"
                    :foreground "LightSkyBlue"
                    :underline t)
(set-face-attribute 'whitespace-space nil
                    :background "Black"
                    :foreground "GreenYellow"
                    :weight 'bold)
(set-face-attribute 'whitespace-empty nil
                    :background "Black")
