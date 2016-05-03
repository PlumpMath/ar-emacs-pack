;;
;; AR pack init file
;;

;;; Fonts
(set-face-attribute 'default nil :height 117)

;;; No backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(message (concat "[ar-emacs-pack] Pack folder: " live-current-pack-dir))

(setq custom-file (concat live-current-pack-dir "custom-configuration.el"))
(message (concat "[ar-emacs-pack] Location of custom-configuration.el: " custom-file))
;; Multiple cursors
(setq mc/list-file (concat live-current-pack-dir "multiple-cursors-prefs.el"))
(message (concat "[ar-emacs-pack] Multiple cursors file: " mc/list-file))
;; Projectile
(setq projectile-cache-file (concat live-current-pack-dir "projectile.cache"))
(setq projectile-known-projects-file (concat live-current-pack-dir "projectile-bookmarks.eld"))
(message (concat "[ar-emacs-pack] Projectile cache: " projectile-cache-file))
(message (concat "[ar-emacs-pack] Projectile known projects file: " projectile-known-projects-file))

;;; Misc
(setq live-disable-zone t)
(setq cua-enable-cua-keys t)
(setq shift-select-mode t)
(setq mouse-drag-copy-region t)
(setq visible-bell t)

;;; Tabs and indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 79)
(setq-default truncate-lines t)
(setq electric-indent-mode t)
(setq ac-auto-start nil)
(setq ac-auto-show-menu 0.8)

;;; Colors
;; http://stackoverflow.com/questions/7874548/emacs-23-3-1-whitespace-style
(setq whitespace-display-mappings
      '(
    (space-mark   ?\     [? ]) ;; use space not dot
    (space-mark   ?\xA0  [?\u00A4]     [?_])
    (space-mark   ?\x8A0 [?\x8A4]      [?_])
    (space-mark   ?\x920 [?\x924]      [?_])
    (space-mark   ?\xE20 [?\xE24]      [?_])
    (space-mark   ?\xF20 [?\xF24]      [?_])
    (newline-mark ?\n    [?$ ?\n])
    (tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])))

(setq whitespace-style (quote (face trailing lines tabs newline space-mark tab-mark newline-mark)))

(custom-set-faces
 '(whitespace-trailing
   ((((class color) (background dark)) (:background "white" :foreground "white"))
    (((class color) (background light)) (:background "yellow" :foreground "yellow"))
    (t (:inverse-video t)))))

;; strong rainbow delimiters
(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                    :foreground "red3"
                    :inherit 'error)

(set-face-attribute 'rainbow-delimiters-mismatched-face nil
                    :foreground "red4"
                    :inherit 'error)

;; git-gutter and linum
(global-git-gutter-mode t)
(git-gutter:linum-setup)

(custom-set-variables
 '(git-gutter:update-interval 2))

(add-hook 'emacs-lisp-mode-hook 'linum-mode)

;; popwin
(push "*cider-apropos*" popwin:special-display-config)
(push "*cider-macroexpansion*" popwin:special-display-config)
(push "*cider-description*" popwin:special-display-config)
(push "*cider-error*" popwin:special-display-config)
(push "*cider-doc*" popwin:special-display-config)
(push '("*cider-compilation*" :noselect t) popwin:special-display-config)
(push '("*git-gutter:diff*" :noselect t) popwin:special-display-config)
(push '("*Geiser dbg*" :noselect t) popwin:special-display-config)
;; (push '(sldb-mode :stick t) popwin:special-display-config)
;; (push 'cider-repl-mode popwin:special-display-config)
;; (push 'cider-connection-list-mode popwin:special-display-config)

;; Magit warnings
(setq magit-last-seen-setup-instructions "2.1.0")
(setq magit-auto-revert-mode nil)
;; Disable vc-git, see
;; https://emacs.stackexchange.com/questions/7544/locally-added-file-under-the-git-version-control-system
;; (setq vc-handled-backends ())

;; Load bindings and configs
(live-load-config-file "bindings.el")
(live-load-config-file "phi-search-conf.el")
(live-load-config-file "helm-conf.el")
(live-load-config-file "projectile-conf.el")
(live-load-config-file "helm-everywhere.el")
(live-load-config-file "perspective-conf.el")
(live-load-config-file "paredit-conf.el")
(live-load-config-file "smartparens-conf.el")
(live-load-config-file "eval-in-repl-conf.el")
(live-load-config-file "restclient-conf.el")
(live-load-config-file "cider-conf.el")
(live-load-config-file "clojure-conf.el")
(live-load-config-file "midje-conf.el")
(live-load-config-file "aggressive-indent-conf.el")
(live-load-config-file "zeal-at-point-conf.el")
(live-load-config-file "synosaurus-conf.el")
(live-load-config-file "org-conf.el")
(live-load-config-file "key-override-conf.el")
(live-load-config-file "git-conf.el")
(live-load-config-file "html-css-conf.el")
(live-load-config-file "racket-conf.el")

;; flyspell
(add-hook 'git-commit-mode-hook
          (lambda ()
            (flyspell-mode)))

(add-hook 'git-rebase-mode-hook
          (lambda ()
            (flyspell-mode)))

(add-hook 'markdown-mode-hook
          (lambda ()
            (flyspell-mode)))

;; Load libs with no config
(require 'misc)
