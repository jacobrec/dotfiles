(let ((file-name-handler-alist nil))
  (setf gc-cons-threshold 100000000)
  (require 'package)
  (package-initialize)
  ;(setq package-archives
  ;  '(("elpa"   . "http://elpa.gnu.org/packages/")
  ;    ("melpa" . "https://melpa.org/packages/"))
  ;(package-refresh-contents)

  (add-to-list 'load-path "~/.emacs.d/use-package/")
  (require 'use-package)

  (use-package esup
    :ensure t)



  (add-to-list 'load-path "~/.emacs.d/j-config/")
  (require 'j-settings)
  (require 'j-funcs)
  (require 'j-keys)
  (require 'j-packages)

  (load-all-in-directory (concat user-emacs-directory "/j-config/lang"))
  (setf gc-cons-threshold 800000))
