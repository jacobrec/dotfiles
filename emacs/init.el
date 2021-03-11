(let ((file-name-handler-alist nil))
  (setf gc-cons-threshold 100000000)
  (require 'package)
  (setq package-archives
   '(("elpa"   . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))
  (package-initialize)
  ; (package-refresh-contents)

  (add-to-list 'load-path "~/.emacs.d/use-package/")
  (require 'use-package)


  (add-to-list 'load-path "~/.emacs.d/j-config/")
  (require 'funcs)
  (require 'settings)
  (require 'keys)
  (require 'packages)

  (load-all-in-directory (concat user-emacs-directory "/j-config/lang"))
  (setf gc-cons-threshold 800000))
;; ## added by OPAM user-setup for emacs / base ## 56ab50dc8996d2bb95e7856a6eddb17b ## you can edit, but keep this line
(require 'opam-user-setup "~/.emacs.d/opam-user-setup.el")
;; ## end of OPAM user-setup addition for emacs / base ## keep this line


;; remove later
(eval-when-compile (require 'cl-lib))
(defun nadvice/linum-update-window (old-fun &rest args)
  (cl-letf* ((old-count-lines (symbol-function #'count-lines))
             ((symbol-function #'count-lines)
              (lambda (&rest args) (1- (apply old-count-lines args)))))
    (apply old-fun args)))

(defun linum-toggle-zero-indexing ()
  (interactive)
  (if (advice-member-p #'nadvice/linum-update-window 'linum-update-window)
      (advice-remove 'linum-update-window #'nadvice/linum-update-window)
    (advice-add 'linum-update-window :around #'nadvice/linum-update-window)))
