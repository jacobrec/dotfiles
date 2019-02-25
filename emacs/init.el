(require 'package)
; (setq package-archives '(("elpa"   . "http://elpa.gnu.org/packages/") ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(add-to-list 'load-path "~/.emacs.d/use-package/")

(require 'use-package)


(setq custom-file (concat user-emacs-directory "/custom.el")) ; this is never loaded anywasy

(show-paren-mode 1) ; show matching parenthesis
(setq vc-follow-symlinks t) ; stop asking me every time



;; remove all those extra ui stuff
(setq inhibit-startup-screen t)
(setq initial-scratch-message "Welcome back Jacob")
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tooltip-mode -1)
(tool-bar-mode -1)

;; backup files no more
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)


(global-linum-mode t) ; line numbers

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
(use-package rainbow-delimiters
  :ensure t
  :defer t)
(use-package evil
  :ensure t
  :defer t
  :init
  (setq evil-shift-width 4)
  (setq evil-shift-round nil)
  (evil-mode)
  (define-key evil-insert-state-map (kbd "TAB") 'tab-to-tab-stop))
(use-package spacemacs-theme
  :defer t
  :init (load-theme 'spacemacs-dark t))
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
   :states '(normal visual insert emacs)
   :prefix "SPC"
   :non-normal-prefix "C-SPC"
   "b"  '(:ignore t :which-key "Buffer")
   "bn" '(my-next-buffer :which-key "buffer next")
   "bp" '(my-previous-buffer :which-key "buffer previous")
   "bb" '(ivy-switch-buffer :which-key "buffer switch")

   "i"  '(:ignore t :which-key "Insert")
   "iu" '(counsel-unicode-char :which-key "insert unicode")

   "s"  '(:ignore t :which-key "Search")
   "sp" '(counsel-ag :which-key "search project")
   "ss" '(swiper :which-key "search project")

   "f"  '(:ignore t :which-key "Files")
   "ff" '(counsel-find-file :which-key "file find")
   "fs" '(save-buffer :which-key "file save")
   "fS" '(evil-write-all :which-key "file save-all")

   "w"  '(:ignore t :which-key "Window")
   "wd" '(delete-window :which-key "window kill")
   "wx" '(delete-window :which-key "window kill with buffer")
   "wo" '(other-window :which-key "window other")
   "wm"  '(:ignore t :which-key "Window Move")
   "wmh" '(evil-window-left :which-key "window move left")
   "wmj" '(evil-window-down :which-key "window move down")
   "wmk" '(evil-window-up :which-key "window move up")
   "wml" '(evil-window-right :which-key "window move right")
   "ws"  '(:ignore t :which-key "Window Split")
   "wsv" '(split-window-below :which-key "window split vertical")
   "wsh" '(split-window-right :which-key "window split horizontal")

   "SPC" '(counsel-M-x :which-key "execute command")))
(use-package which-key :ensure t
  :init
  (which-key-mode)
  :diminish (which-key-mode . "Ꙍ")
  :config
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.05))
(use-package ivy :ensure t
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
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
  

;; lisp stuff
(add-hook 'emacs-lisp-mode-hook
  (lambda ()
    (setq evil-shift-width 2)))
          
(use-package parinfer
  :ensure t
  :defer t
  :diminish (parinfer-mode . "↯") ; does not display parinfer in the modeline
  :init
  (progn
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
(use-package clojure-mode
  :ensure t
  :defer t)

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
(add-hook 'rust-mode-hook
          (lambda ()
            (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; pretty brackets
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))

;; go stuff
(use-package go-mode
  :defer t
  :ensure t)
(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (add-hook 'prog-mode-hook 'rainbow-delimiters-mode) ;; pretty brackets
            (setq tab-width 4)
            (setq indent-tabs-mode 1)))
