(use-package rjsx-mode
  :ensure t
  :config
  (progn
    (setq-default evil-shift-width 2)
    (setq js-indent-level 2)
    (setq tab-width 2)
    (setq js2-strict-missing-semi-warning nil)))

(add-to-list 'auto-mode-alist '("\\.jsx$" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . rjsx-mode))
