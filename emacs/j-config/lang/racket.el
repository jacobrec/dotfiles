(use-package racket-mode
  :ensure t
  :defer t
  :config
  (company-mode nil)
  (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "C-SPC"
     "m"  '(:ignore t :which-key "Mode (Racket)")
     "me"  '(:ignore t :which-key "Eval")
     "mef" '(racket-send-definition :which-key "eval function")
     "mer" '(racket-send-region :which-key "eval region")
     "meb" '(racket-run :which-key "eval buffer")
     "mel" '(racket-send-last-sexp :which-key "eval last s-exp")

     "md" '(racket-describe :which-key "describe")

     "mv"  '(:ignore t :which-key "Visit")
     "mvm" '(racket-visit-module :which-key "visit module")
     "mvd" '(racket-visit-definition :which-key "visit definition")
     "mvb" '(racket-unvisit :which-key "unvisit (visit back)")))
