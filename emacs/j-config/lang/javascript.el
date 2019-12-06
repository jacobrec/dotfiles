(use-package rjsx-mode
  :ensure t
  :mode "\\.\\(js\\|jsx\\)\\'"
  :config
  (progn
    (setq-default evil-shift-width 2)
    (setq js-indent-level 2)
    (setq tab-width 2)
    (setq js2-strict-missing-semi-warning nil)))
