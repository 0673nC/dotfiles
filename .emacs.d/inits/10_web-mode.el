;;=======================================================
;;;    web-mode
;;=======================================================

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

(setq web-mode-engines-alist 
      '(("php" . "\\.phtml\\'")
        ("blade" . "\\.blade\\."))
      )

(require 'auto-complete)
(require 'auto-complete-config)
(add-to-list 'ac-modes 'web-mode)

;;; hooks
(defun web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  ;; (setq web-mode-html-offset   2)
  ;; (setq web-mode-css-offset    2)
  ;; (setq web-mode-script-offset 2)
  ;; (setq web-mode-php-offset    2)
  ;; (setq web-mode-java-offset   2)
  ;; (setq web-mode-asp-offset    2)
  )
(add-hook 'web-mode-hook 'web-mode-hook)

(add-hook 'web-mode-hook
 '(lambda ()
    (add-to-list 'ac-dictionary-files
                 "~/.emacs.d/ac-dict/web-mode")
    (define-key web-mode-map "\C-m" 'newline-and-indent)
    ))


;; color
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
)
