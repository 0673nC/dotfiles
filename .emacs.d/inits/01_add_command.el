;;===============================================
;;; add command
;;==============================================

;;goto the line you choose
(global-set-key "\M-g" 'goto-line)

;;ctrl-h to delete
(keyboard-translate ?\C-h ?\C-?)

;;compile
(global-set-key "\C-cc" 'compile)

;;reload
(global-set-key "\C-cr" 'revert-buffer)

;;window-move
(global-set-key [C-tab] 'other-window)

;; C-k kill-line + \n
(setq kill-whole-line t)

;; \C-a indent-skip-head
(defun beginning-of-indented-line (current-point)
  (interactive "d")
  (if (string-match
       "^[ \t]+$"
       (save-excursion
         (buffer-substring-no-properties
          (progn (beginning-of-line) (point))
          current-point)))
      (beginning-of-line)
    (back-to-indentation)))
(defun beginning-of-visual-indented-line (current-point)
  (interactive "d")
  (let ((vhead-pos (save-excursion (progn (beginning-of-visual-line) (point))))
        (head-pos (save-excursion (progn (beginning-of-line) (point)))))
    (cond
     ((eq vhead-pos head-pos)
      (if (string-match
           "^[ \t]+$"
           (buffer-substring-no-properties vhead-pos current-point))
          (beginning-of-visual-line)
        (back-to-indentation)))
     ((eq vhead-pos current-point)
      (backward-char)
      (beginning-of-visual-indented-line (point)))
     (t (beginning-of-visual-line)))))

(global-set-key "\C-a" 'beginning-of-visual-indented-line)
(global-set-key "\C-e" 'end-of-visual-line)

;;forward/backward - word C-[F/B]
(global-set-key (kbd "C-S-f") 'forward-word)
(global-set-key (kbd "C-S-b") 'backward-word)

;;forward/backward - sentence C-[A/E]
(global-set-key (kbd "C-S-e") 'forward-sentence)
(global-set-key (kbd "C-S-a") 'backward-sentence)

;;scroll-down
(global-set-key (kbd "C-S-v") 'scroll-down)

;;mac command-key to meta
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

;;window-resizer
(global-set-key "\C-c\C-r" 'window-resizer)

;;all-indent
(global-set-key "\C-ci" 'indent-region)

;; open - close function
(define-key global-map (kbd "\C-c\C-f") 'hs-toggle-hiding)
