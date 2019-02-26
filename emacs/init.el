(require 'package)
;; XXX this is needed on install only, uncomment for first run
;(setq package-archives '(("elpa"   . "http://elpa.gnu.org/packages/") ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(add-to-list 'load-path "~/.emacs.d/use-package/")
(require 'use-package)


(add-to-list 'load-path "~/.emacs.d/j-config/")
(require 'j-settings)
(require 'j-funcs)
(require 'j-keys)
(require 'j-packages)

(load-all-in-directory (concat user-emacs-directory "/j-config/lang"))
