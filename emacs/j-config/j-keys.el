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
   "bd" '(kill-this-buffer :which-key "buffer delete")

   "i"  '(:ignore t :which-key "Insert")
   "iu" '(counsel-unicode-char :which-key "insert unicode")

   "s"  '(:ignore t :which-key "Search")
   "sp" '(counsel-ag :which-key "search project")
   "ss" '(swiper :which-key "search project")

   "f"  '(:ignore t :which-key "Files")
   "ff" '(counsel-find-file :which-key "file find")
   "fr" '(counsel-recentf :which-key "file recent")
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

(provide 'j-keys)
