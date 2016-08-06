;;================================================
;;;  file name at title
;;================================================
(defun elscreen-flame-title-update()
  (setq frame-title-format (format "screen:[%d] - %%b" (elscreen-get-current-screen)))
  )
(add-hook 'elscreen-screen-update-hook 'elscreen-flame-title-update)
