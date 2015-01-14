;;
;; AR pack init file
;;

;;; No backups
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files
(setq custom-file "~/.live-packs/ar-emacs-pack/custom-configuration.el")

;;; Misc
(setq live-disable-zone t)
(setq cua-enable-cua-keys t)
(setq mouse-drag-copy-region t)
(setq mc/list-file "~/.live-packs/ar-emacs-pack/mc-lists.el")
(setq visible-bell t)

;;; Tabs and indent
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 100)
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

;; git-gutter and linum
(git-gutter:linum-setup)
(global-git-gutter-mode +1)

;; yasnippet + clojure
(add-hook 'clojure-mode-hook
          (lambda ()
            (yas/minor-mode 1)))

(add-hook 'clojure-mode-hook 'git-gutter-mode)

;; Load bindings and configs
(live-load-config-file "bindings.el")
(live-load-config-file "phi-search-conf.el")
(live-load-config-file "column-indicator-conf.el")
(live-load-config-file "cider-conf.el")
(live-load-config-file "clojure-snippets-conf.el")
(live-load-config-file "projectile-conf.el")
;; (live-load-config-file "themes.el")

;; Load libs with no config
(require 'xcopypaste)
(require 'misc)
