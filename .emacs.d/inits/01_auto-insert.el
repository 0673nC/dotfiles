;;=====================================================
;;;    auto-insert
;;=====================================================

;; auto-insert template
(setq auto-insert-directory "~/.emacs.d/templates/")
;;auto-insert-query off
(setq auto-insert-query nil)
(load "autoinsert" t)
(setq auto-insert-alist 
      (append '(
                ("\\.cpp$" . "template.cpp")
                ("\\.c$" . "template.c")
                ("\\.php$" . "template.php")
                ("\\.java$" . "template.java")
                ("\\.cs$" . "template.cs")
                ("\\.el$" . nil)
                )
              auto-insert-alist ))

(add-hook 'find-file-hooks 'auto-insert)
(add-hook 'find-file-not-found-hooks 'auto-insert)
