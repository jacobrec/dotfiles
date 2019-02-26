(use-package web-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(flycheck-add-mode 'javascript-standard 'web-mode)
