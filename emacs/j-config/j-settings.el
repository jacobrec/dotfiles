(setq custom-file (concat user-emacs-directory "/custom.el")) ; this is never loaded anywasy

(show-paren-mode 1) ; show matching parenthesis
(setq vc-follow-symlinks t) ; stop asking me every time

(set-face-attribute 'default nil :height 150)


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

(provide 'j-settings)
