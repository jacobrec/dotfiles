(setq my-c-style
    '((rainbow-delimiters-mode)
      (set tab-width 4)
      (set indent-tabs-mode 1)))

(add-hook 'c-mode-common-hook
  (lambda () (c-add-style "jc" my-c-style t)))

