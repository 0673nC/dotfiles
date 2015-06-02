;;================================================
;;;  auto-compleate
;;================================================

;; ;; 対象の全てで補完を有効にする
(global-auto-complete-mode t)
(require 'auto-complete-config)
(ac-config-default)

;;candidate selection M-n/M-p
(define-key ac-completing-map (kbd "\M-n") 'ac-next)
(define-key ac-completing-map (kbd "\M-p") 'ac-previous)
(define-key ac-completing-map (kbd "\M-/") 'ac-stop)

;; 補完が自動で起動するのを停止
;;(setq ac-auto-start nil)

;; trigger key
(ac-set-trigger-key "TAB")

;; 候補の最大件数 デフォルトは 10件
(setq ac-candidate-max 20)

;; 曖昧マッチ
(require 'fuzzy)
(setq ac-use-fuzzy t)

;; 大文字・小文字を区別する
(setq ac-ignore-case nil)
