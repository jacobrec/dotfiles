(use-package evil
  :ensure t
  :init
  (progn
    (setq evil-shift-round nil)
    (evil-mode)
    (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop)))

(use-package evil-escape
  :ensure t
  :diminish evil-escape-mode
  :init
  (evil-escape-mode)
  :config
  (setq-default evil-escape-key-sequence "jk"))

(use-package diminish
  :ensure t
  :init
  (diminish 'undo-tree-mode)
  (diminish 'global-whitespace-mode))

(use-package wakatime-mode
  :ensure t
  :init (global-wakatime-mode))



(use-package flycheck
  :ensure t
  :diminish (flycheck-mode . "f")
  :init (global-flycheck-mode))

(use-package doom-themes
  :ensure t
  :init
  (load-theme 'doom-one t))

(use-package rainbow-delimiters
  :ensure t)

(use-package company
  :ensure t
  :diminish (company-mode . "©")
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
          (setq company-minimum-prefix-length 1))

(use-package which-key :ensure t
  :init
  (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05))

(use-package ivy :ensure t
  :diminish ivy-mode ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (:map ivy-mode-map  ; bind in the ivy buffer
         ("C-'" . ivy-avy)) ; C-' to ivy-avy
  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 20)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ")) ; count format, from the ivy help page

(use-package counsel :ensure t
  :bind*                           ; load counsel when pressed
  (("M-x"     . counsel-M-x)       ; M-x use counsel
   ("C-x C-f" . counsel-find-file) ; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)   ; search recently edited files
   ("C-c f"   . counsel-git)       ; search for files in git repo
   ("C-c s"   . counsel-git-grep)  ; search for regexp in git repo
   ("C-c /"   . counsel-ag)        ; search for regexp in git repo using ag
   ("C-c l"   . counsel-locate)))   ; search for files or else using locate

(provide 'j-packages)
