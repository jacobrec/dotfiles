(use-package parinfer
  :ensure t
  :defer t
  :diminish (parinfer-mode . "↯") ; does not display parinfer in the modeline
  :config
  (setq-default evil-shift-width 2)
  (setq-default tab-width 2)
  (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "C-SPC"
     "mi"  '(parinfer-toggle-mode :which-key "ParInfer Toggle mode"))
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             pretty-parens  ; different paren styles for different modes.
             evil           ; If you use Evil.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'racket-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)))

(use-package slime
  :ensure t
  :defer t
  :config
  (setq inferior-lisp-program "/usr/bin/sbcl")
  (setq slime-contribs '(slime-fancy))
  (slime-setup)
  (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "C-SPC"
     "m"  '(:ignore t :which-key "Mode (Lisp)")
     "me"  '(:ignore t :which-key "Eval")
     "mef" '(slime-eval-defun :which-key "eval function")
     "mer" '(slime-eval-region :which-key "eval region")
     "meb" '(slime-eval-buffer :which-key "eval buffer")
     "mel" '(slime-eval-last-expression :which-key "eval last s-exp")))
