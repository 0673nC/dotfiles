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
