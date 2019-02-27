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
   "fr" '(quit-window :which-key "file recent")

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
   "wq" '(evil-quit :which-key "window quit")

   "SPC" '(counsel-M-x :which-key "execute command")))


(provide 'j-keys)
