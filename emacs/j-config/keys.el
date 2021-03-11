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
   "ss" '(swiper :which-key "search this file")

   "f"  '(:ignore t :which-key "Files")
   "ff" '(counsel-find-file :which-key "file find")
   "fr" '(counsel-recentf :which-key "file recent")
   "fs" '(save-buffer :which-key "file save")
   "fS" '(evil-write-all :which-key "file save-all")
   "fq" '(quit-window :which-key "file recent")

   ;"e"  '(:ignore t :which-key "Emacs")
   ;"er" '((lambda () (interactive) (load-file "~/.emacs.d/init.el")) :which-key "Reload Config")

   "w"  '(:ignore t :which-key "Window")
   "wd" '(delete-window :which-key "window kill")
   "wx" '(delete-window :which-key "window kill with buffer")
   "wn" '(other-window :which-key "window next")
   "wo" '(delete-other-windows :which-key "window only this")
   "wm" '(:ignore t :which-key "Window Move")
   "wmh" '(evil-window-left :which-key "window move left")
   "wmj" '(evil-window-down :which-key "window move down")
   "wmk" '(evil-window-up :which-key "window move up")
   "wml" '(evil-window-right :which-key "window move right")
   "ws" '(:ignore t :which-key "Window Split")
   "wsv" '(split-window-right :which-key "window split vertical")
   "wsh" '(split-window-below :which-key "window split horizontal")
   "wq" '(evil-quit :which-key "window quit")

   "SPC" '(counsel-M-x :which-key "execute command")))

(global-set-key (kbd "<mouse-6>") (lambda () (interactive) (scroll-right 6)))
(global-set-key (kbd "<mouse-7>") (lambda () (interactive) (scroll-left 6)))
(provide 'keys)
