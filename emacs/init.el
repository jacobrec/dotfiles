(require 'package)
(package-initialize)


(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(add-to-list 'load-path "~/.emacs.d/rainbow")
(add-to-list 'load-path "~/.emacs.d/evil")

(require 'evil)
(require 'rainbow-delimiters)
(require 'use-package)

(setq custom-file (concat user-emacs-directory "/custom.el")) ; this is never loaded anywasy
(evil-mode 1) ; use evil mode
(show-paren-mode 1) ; show matching parenthesis
(setq vc-follow-symlinks t) ; stop asking me every time



;; remove all those extra ui stuff
(setq inhibit-startup-screen t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; backup files no more
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)


(global-linum-mode t) ; line numbers
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; pretty brackets

(defun my-change-buffer (change-buffer)
  "Switch to the next buffer, while ignoring * buffers.
-  Use CHANGE-BUFFER to determine the direction."
  (let ((bread-crumb (buffer-name)))
    (funcall change-buffer)
    (while
        (and
         (string-match-p "^\*" (buffer-name))
          ;; to add more regexs to ignore, copy the line above
         (not ( equal bread-crumb (buffer-name))))
      (funcall change-buffer))))
(defun my-next-buffer ()
  "Next buffer."
  (interactive)
  (my-change-buffer 'next-buffer))
(defun my-previous-buffer ()
  "Prevoius buffer."
  (interactive)
  (my-change-buffer 'previous-buffer))



;; General stuff
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))
(use-package ag
  :ensure t
  :defer t)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(use-package company
  :ensure t
  :hook (prog-mode . company-mode)
  :config (setq company-tooltip-align-annotations t)
          (setq company-minimum-prefix-length 1))
(use-package general :ensure t
  :config
  (general-evil-setup t)
  (general-auto-unbind-keys)
  (general-define-key
   :states '(normal); motion insert emacs
   :prefix "SPC"
   "b"  '(:ignore t :which-key "Buffer")
   "bn" '(my-next-buffer :which-key "buffer next")
   "bp" '(my-previous-buffer :which-key "buffer previous")))
(use-package which-key :ensure t
  :init
  (which-key-mode)
  :diminish (which-key-mode . "Ꙍ")
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05))

;; lisp stuff
(use-package parinfer
  :ensure t
  :defer t
  :init
  (progn
    (setq evil-shift-width 2)
    (setq parinfer-extensions
          '(defaults       ; should be included.
            pretty-parens  ; different paren styles for different modes.
            evil           ; If you use Evil.
            smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
            smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))


;; rust stuff
(use-package flycheck-rust
  :defer t
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(use-package rust-mode
  :defer t
  :ensure t)
(use-package cargo
  :defer t
  :ensure t
  :hook (rust-mode . cargo-minor-mode))
(use-package toml-mode
  :defer t
  :ensure t)

;; go stuff
(use-package go-mode
  :defer t
  :ensure t)
