;;================================================
;;; php-mode
;;================================================

;(load-library "php-mode-1.5.0")
(require 'php-mode)
(setq php-mode-force-pear t)

(setq auto-mode-alist
      (append '(("\\.php$" . php-mode)) auto-mode-alist))

(add-to-list 'ac-modes 'php-mode)

(add-hook 'php-mode-hook
          '(lambda () 
             ;; open - close function
             (hs-minor-mode 1)
             (define-key php-mode-map "\C-c\C-f" 'hs-toggle-hiding)
             ;; php-completion
             (require 'php-completion)
             (php-completion-mode t)
             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete) ;php-completionの補完実行キーバインドの設定
             (make-local-variable 'ac-sources)
             (setq ac-sources '(
                                ac-source-words-in-same-mode-buffers
                                ac-source-php-completion
                                ac-source-filename
                                ))))
