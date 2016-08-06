;;==================================================================
;;;     elscreen
;;==================================================================
(require 'elscreen)
(setq elscreen-prefix-key "\C-t")
(setq elscreen-display-tab nil)
(elscreen-separate-buffer-list-mode 1)

;; elscreen-server
(require 'elscreen-server)


(elscreen-start)
