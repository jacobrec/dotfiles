(use-package clojure-mode
  :ensure t
  :defer t
  :config
  (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "C-SPC"
     "m"   '(:ignore t :which-key "Mode (Clojure)")
     "me"  '(:ignore t :which-key "Eval")
     "mea" '(cider-eval-all-files :which-key "eval all files")
     "mer" '(cider-eval-region :which-key "eval region")
     "meb" '(cider-eval-buffer :which-key "eval buffer")
     "mel" '(cider-eval-last-expression :which-key "eval last s-exp")))

(use-package cider
  :ensure t
  :defer t)
