;;================================================
;;;     helm
;;================================================

(require 'helm-config)
(require 'helm-files)
(require 'helm-mode)
(require 'helm-misc)
(require 'helm-ls-git)


(helm-mode 1)

;;(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-;") 'helm-mini)

;; helm-mini buffer
(progn
  (custom-set-variables
   '(helm-mini-default-sources '(helm-source-buffers-list
                                 helm-source-files-in-current-dir
                                 helm-source-ls-git
                                 helm-source-recentf
                                 helm-source-buffer-not-found))
   ))

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
  (kill-new (buffer-substring (point) (field-end))))

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))

;; helm-mapでC-hを削除に
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

;; TABをActionから補完に
(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; helm-find-fileでC-wをActionに
(define-key helm-c-read-file-map (kbd "C-w") 'helm-select-action)
(define-key helm-find-files-map (kbd "C-w") 'helm-select-action)
(define-key helm-read-file-map (kbd "C-w") 'helm-select-action)

;; その他キー設定
(define-key global-map (kbd "C-x C-b")   'helm-buffers-list)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x b") 'helm-ls-git-ls)
(define-key global-map (kbd "M-x") 'helm-M-x)

;; helm-find-file と execute-extended-command の無効化
;(add-to-list 'helm-completing-read-handlers-alist '(execute-extended-command . nil))
;(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
