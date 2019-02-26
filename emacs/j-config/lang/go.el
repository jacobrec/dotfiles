(use-package go-mode
  :defer t
  :ensure t)

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; pretty brackets
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
