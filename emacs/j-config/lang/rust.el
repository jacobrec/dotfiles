(use-package flycheck-rust
  :defer t
  :ensure t
  :config
  (progn
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)))

(use-package rust-mode
  :defer t
  :ensure t
  :config
  (progn
    (rainbow-delimiters-mode) ;; pretty brackets
    (setq tab-width 4)
    (setq indent-tabs-mode 1)))

(use-package cargo
  :defer t
  :ensure t
  :hook (rust-mode . cargo-minor-mode))

(use-package toml-mode
  :defer t
  :ensure t)
