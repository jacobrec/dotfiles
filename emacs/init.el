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

;; remove all those extra ui stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

;; backup files in /tmp
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

(global-linum-mode t) ; line numbers
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; pretty brackets


;; Color theme
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))

(use-package ag
  :defer t)

(use-package parinfer
  :ensure t
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

