;;=====================================================================
;;      shackle mode
;;=====================================================================

(require 'shackle)
(setq shackle-rules
      '(;; helmコマンドは下部に5割の大きさで表示
        ("\*helm" :regexp t :align below :ratio 0.5)
        ))
(shackle-mode 1)
(setq shackle-lighter "")

;;; C-zで直前のウィンドウ構成に戻す
(winner-mode 1)
(global-set-key (kbd "C-z") 'winner-undo)

;; Turn off `shackle-mode' when there is only one window
(add-hook 'helm-before-initialize-hook
          (defun helm-disable-shackle-mode-maybe ()
            (when (one-window-p)
              (shackle-mode -1))))

;; Turn on `shackle-mode' when quitting helm session normally
(add-hook 'helm-exit-minibuffer-hook #'shackle-mode)

;; Turn on `shackle-mode' when quitting helm session abnormally
(defun helm-keyboard-quit--enable-shackle-mode (orig-func &rest args)
  (shackle-mode)
  (apply orig-func args))

(advice-add 'helm-keyboard-quit :around #'helm-keyboard-quit--enable-shackle-mode)
