(setq custom-file (concat user-emacs-directory "/custom.el")) ; this is never loaded anywasy

(setq vc-follow-symlinks t) ; stop asking me every time



;; remove all those extra ui stuff
(setq inhibit-startup-screen t)
(setq initial-scratch-message "Welcome back Jacob")
(progn
  (menu-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1)
  (tool-bar-mode -1)
  (set-face-attribute 'default nil :height 150))


;; backup files no more
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)


(global-linum-mode t) ; line numbers
(show-paren-mode 1) ; show matching parenthesis

(provide 'j-settings)
