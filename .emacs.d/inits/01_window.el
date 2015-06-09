;;====================================
;;;    window
;;====================================

(setq initial-frame-alist
      (append
       '(;(top . 20)    ; frame Y position(pixel)
         (left . 1000)    ; frame X position(pixel)
         (width . 80)    ; frame width(char)
         (height . 37)   ; frame height(char)
         (font . "fontset-16") ; font size
         ) initial-frame-alist))


(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))


;; director tree
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(require 'direx)

(setq direx:leaf-icon "  "
      ;;direx:open-icon "\&#9662; "
      ;;direx:closed-icon "&#9654; ")
      direx:open-icon "V "
      direx:closed-icon "> ")
(push '(direx:direx-mode :position left :width 30 :dedicated t)
      popwin:special-display-config)
(global-set-key (kbd "C-c C-j") 'direx:jump-to-directory-other-window)


;; mode-line
;; powerline
(require 'powerline)
(powerline-center-theme)

(set-face-attribute 'mode-line nil
                    :foreground "#fff"
                    :background "#00008b"
                    :box nil)

(set-face-attribute 'powerline-active1 nil
                    :foreground "#fff"
                    :background "#6495ed"
                    :inherit 'mode-line)

;; (set-face-attribute 'powerline-active2 nil
;;                     :foreground "#000"
;;                     :background "#00ffff"
;;                     :inherit 'mode-line)


(defvar mode-line-cleaner-alist
  '(;; major mode
    (lisp-interaction-mode . "Li")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (scala-mode . "Sc")
    (markdown-mode . "Md")
    (fundamental-mode . "Fu")
    ;;minor mode
    (auto-complete-mode . "")
    (yas-minor-mode . "")
    (abbrev-mode . "")
    (helm-mode . "")
    (flymake-mode . " Fm")
    (git-gutter-mode . "")
    (magit-auto-revert-mode . "")
    (ruby-block-mode . "")
    (hs-minor-mode . "")
    ))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)
