;;=======================================================
;;;   coffee-mode
;;=======================================================

(require 'coffee-mode)
(defun coffee-custom ()
  "coffee-mode-hook"
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-to-list 'ac-modes 'coffee-mode)

(add-hook 'coffee-mode-hook
  '(lambda()
     (coffee-custom)
     ))
