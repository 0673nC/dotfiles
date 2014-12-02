;;================================================
;;;  init
;;================================================
(load "~/.emacs.d/inits/package.el")

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")
