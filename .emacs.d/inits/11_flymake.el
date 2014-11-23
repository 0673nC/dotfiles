;;================================================
;;;flymake
;;================================================
(add-to-list 'load-path "~/emacs-24.3/lisp/progmodes")
(require 'flymake)

(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-std=c++11" "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)
(add-hook 'c++-mode-hook
          '(lambda ()
             (flymake-mode t)))

(defun flymake-c-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "gcc" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))
(push '("\\.c$" flymake-c-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))

(setq char_set "utf-8")
(setq classpath
    ;  (getenv "CLASS_PATH"))
      nil)
;; (defun flymake-java-init ()
;;   (flymake-simple-make-init-impl
;;    'flymake-create-temp-with-folder-structure nil nil
;;    buffer-file-name
;;    'flymake-get-java-cmdline))
;; (defun flymake-get-java-cmdline
;;   (source base-dir)
;;   (list "javac"
;;         (if classpath
;;             (list "-classpath" classpath 
;;                   (concat "-J-Dfile.encoding=" char_set) "-encoding" char_set source)
;;           (list (concat "-J-Dfile.encoding=" char_set)
;;            "-encoding" char_set source)
;;           )))
;; (push '("\\.java$" flymake-java-init) flymake-allowed-file-name-masks)
;; (add-hook 'java-mode-hook 
;;           '(lambda ()
;;              (flymake-mode t)))

;;error and warning color setting
(set-face-background 'flymake-errline "red")
(set-face-background 'flymake-warnline "yellow")

(global-set-key "\C-cf" (quote flymake-display-err-menu-for-current-line))

;;show  error and warning at mini buffer
(defun flymake-display-err-minibuf ()
  "Displays the error/warning for the current line in the minibuffer"
  (interactive)
  (let* ((line-no (flymake-current-line-no))
         (line-err-info-list  (nth 0 (flymake-find-err-info flymake-err-info line-no)))
         (count (length line-err-info-list))
         )
    (while (> count 0)
      (when line-err-info-list
        (let* ((file (flymake-ler-file (nth (1- count) line-err-info-list)))
               (full-file (flymake-ler-full-file (nth (1- count) line-err-info-list)))
               (text (flymake-ler-text (nth (1- count) line-err-info-list)))
               (line (flymake-ler-line (nth (1- count) line-err-info-list))))
          (message "[%s] %s" line text)
          )
        )
      (setq count (1- count)))))

(global-set-key "\C-cf" 'flymake-display-err-minibuf)
