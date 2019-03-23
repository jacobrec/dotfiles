(use-package meghanada
  :ensure t
  :defer t

  :init
  (add-hook 'java-mode-hook
          (lambda ()
            ;; meghanada-mode on
            (meghanada-mode t)
            (flycheck-mode +1)
            (setq c-basic-offset 4)))
            ;(add-hook 'before-save-hook 'meghanada-code-beautify-before-save)))

  :config
  (general-define-key
     :states '(normal visual insert emacs)
     :prefix "SPC"
     :non-normal-prefix "C-SPC"
     "m"   '(:ignore t :which-key "Mode (Java)")

     "mj"  '(:ignore t :which-key "Jump")
     "mjd" '(meghanada-jump-declaration :which-key "jump declaration")
     "mjs" '(meghanada-jump-symbol :which-key "jump symbol")
     "mjb" '(meghanada-back-jump :which-key "jump back")

     "mi"  '(:ignore t :which-key "Import")
     "mio" '(meghanada-optimize-import :which-key "import organize")
     "mia" '(meghanada-import-all :which-key "import add all")
     "mit" '(meghanada-import-at-point :which-key "import this")

     "ms"  '(:ignore t :which-key "Server")
     "msr" '(meghanada-server-restart :which-key "server restart")
     "mss" '(meghanada-server-start :which-key "server start")
     "msk" '(meghanada-server-kill :which-key "server kill")
     "msc" '(meghanada-client-connect :which-key "server connect")

     "mf" '(meghanada-code-beautify :which-key "Format")
     "me" '(meghanada-exec-main :which-key "Exec main")
     "md" '(meghanada-debug-main :which-key "Debug main")
     "mr" '(meghanada-reference :which-key "Search References")))
