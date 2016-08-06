;;====================================
;;;    window
;;====================================

(setq initial-frame-alist
      (append
       '(;(top . 20)    ; frame Y position(pixel)
         ;(left . 1000)    ; frame X position(pixel)
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

;; mode-line
(defvar mode-line-cleaner-alist
  '(;; major mode
    (lisp-interaction-mode . "Li")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (scala-mode . "Sc")
    (markdown-mode . "Md")
    (fundamental-mode . "Fu")
    (js2-mode . "Js")
    (coffee-mode . "Co")
    (java-mode . "Ja")
    (php-mode . "PHP")
    ;;minor mode
    (auto-complete-mode . "")
    (yas-minor-mode . "")
    (company-mode . "")
    (abbrev-mode . "")
    (helm-mode . "")
    (flymake-mode . " Fm")
    (git-gutter-mode . "")
    (magit-auto-revert-mode . "")
    (ruby-block-mode . "")
    (hs-minor-mode . "")
    (php-completion-mode . "")
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
