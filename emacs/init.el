(require 'package)

;; MELPA setup
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;;(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t))
(package-initialize)

(load "~/.emacs.d/init-packages")

;; VISUALS
(load-theme 'solarized-dark t)
(menu-bar-mode -1)
(tool-bar-mode -1)
(toggle-scroll-bar -1)
(setq inhibit-startup-screen t)


(setq backup-directory-alist `(("." . "/tmp/emacs")))

;; EVIL MODE
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
