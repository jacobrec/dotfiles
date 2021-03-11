;this is never loaded anywasy)
(setq custom-file (concat user-emacs-directory "/custom.el"))

(setq vc-follow-symlinks t) ; stop asking me every time



;; remove all those extra ui stuff
(setq inhibit-startup-screen t)
(setq initial-scratch-message "Welcome back Jacob")

; for gui, this is all handled in xresourses
(unless (display-graphic-p)
  (menu-bar-mode -1))
; (scroll-bar-mode -1)
; (tooltip-mode -1)
; (tool-bar-mode -1)
; (set-face-attribute 'default nil :height 150))



;; backup files no more
(setq backup-inhibited t
      make-backup-files nil
      auto-save-default nil
      auto-save-list-file-prefix nil)


(global-linum-mode t) ; line numbers
(show-paren-mode 1) ; show matching parenthesis
(setq whitespace-line-column 220); column width before emacs gets mad
(if (display-graphic-p)     ;; only in gui mode
  (global-whitespace-mode)) ;; show whitespace


(setq-default indent-tabs-mode nil) ;; no tabs
(setq-default tab-width 4)

(setq org-confirm-babel-evaluate nil) ; stop asking if I actually want to run it
(org-babel-do-load-languages
  'org-babel-load-languages ; org-babel language list
    '((python . t)
      (plantuml . t)
      (dot . t)))
(add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
(setq org-plantuml-jar-path (expand-file-name "/usr/share/java/plantuml/plantuml.jar"))
(defun my/fix-inline-images ()
  (when org-inline-image-overlays
    (org-redisplay-inline-images)))

(add-hook 'org-babel-after-execute-hook 'my/fix-inline-images)

(setq create-lockfiles nil) ; no lockfiles. This kills react

(provide 'settings)
