;;==================================================================
;;;      package
;;==================================================================
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
(require 'cl)
(defvar installing-package-list
  '(auto-complete
    yasnippet
    coffee-mode
    helm
    helm-ls-git
    helm-git-grep
    js2-mode
    web-mode
    scala-mode2
    ensime
    ruby-block
    php-mode
    php-completion  
    direx
    popwin
    shell-pop
    init-loader
    tabbar
    powerline
    ))
(let ((not-installed 
       (loop for x in installing-package-list
             when (not (package-installed-p x))
             collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

