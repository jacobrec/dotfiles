(use-package web-mode
  :ensure t)
(use-package js2-mode
  :ensure t
  :init
  (flycheck-select-checker 'javascript-standard)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode)))



