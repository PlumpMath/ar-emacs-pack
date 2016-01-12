(message "Loading my own custom-configuration.el...")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cider-boot-parameters "cider repl -s wait")
 '(custom-safe-themes
   (quote
    ("7bde52fdac7ac54d00f3d4c559f2f7aa899311655e7eb20ec5491f3b5c533fe8" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" default)))
 '(git-commit-fill-column 100)
 '(git-commit-summary-max-length 80)
 '(git-gutter:update-interval 2)
 '(haskell-notify-p t)
 '(haskell-process-type (quote ghci))
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(safe-local-variable-values
   (quote
    ((clojure-mode
      (eval aggressive-indent-mode -1))
     (eval add-to-list
           (quote aggressive-indent-excluded-modes)
           (quote clojure-mode))
     (eval push
           (quote
            (-contains\? minor-mode-list
                         (quote clojure-mode)))
           aggressive-indent-dont-indent-if)
     (eval push
           (quote
            (derived-mode-p
             (quote clojure-mode)))
           aggressive-indent-dont-indent-if)
     (eval push
           (quote
            (derived-mode-p
             (quote clojure-mode)))
           (quote aggressive-indent-dont-indent-if))
     (eval push
           (quote
            (null true))
           aggressive-indent-dont-indent-if)
     (projectile-grep-default-files quote
                                    ("*.clj" "*.cljs" "*.cljc"))
     (eval push
           (quote clojure-mode)
           live-ignore-whitespace-modes)
     (projectile-create-missing-test-files . t)
     (projectile-project-type . lein-midje)
     (projectile-grep-default-files quote
                                    ("*.clj" "*.java")))))
 '(sclang-auto-scroll-post-buffer t)
 '(sclang-eval-line-forward nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diff-added ((t (:foreground "Green"))))
 '(diff-removed ((t (:foreground "Red"))))
 '(ediff-even-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-even-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(ediff-odd-diff-A ((((class color) (background dark)) (:background "dark green"))))
 '(ediff-odd-diff-B ((((class color) (background dark)) (:background "dark red"))))
 '(mumamo-background-chunk-major ((((class color) (background dark)) (:background "black"))) t)
 '(mumamo-background-chunk-submode1 ((((class color) (background dark)) (:background "black"))) t)
 '(whitespace-trailing ((((class color) (background dark)) (:background "white" :foreground "white")) (((class color) (background light)) (:background "yellow" :foreground "yellow")) (t (:inverse-video t)))))
