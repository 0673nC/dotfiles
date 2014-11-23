;;================================================
;;;     helm
;;================================================

(require 'helm-config)
(require 'helm-files)
(require 'helm-mode)
(require 'helm-misc)

(helm-mode 1)

(global-set-key (kbd "C-c h") 'helm-mini)

(add-to-list 'helm-completing-read-handlers-alist '(execute-extended-command . nil))
(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))

(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)


;; (define-key helm-map (kbd "C-h") 'delete-backward-char)
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;; (define-key global-map (kbd "C-x C-f") 'helm-find-files)
