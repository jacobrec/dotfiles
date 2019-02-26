(use-package evil
  :ensure t
  :defer t
  :init
  (setq evil-shift-width 4)
  (setq evil-shift-round nil)
  (evil-mode)
  (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package doom-themes
  :ensure t :defer t
  :init
  (load-theme 'doom-one t))

(use-package rainbow-delimiters
  :ensure t
  :defer t)

(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
          (setq company-minimum-prefix-length 1))

(provide 'j-packages)
