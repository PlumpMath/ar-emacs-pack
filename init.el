;;
;; AR pack init file
;;

;;; Files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

(setq cua-enable-cua-keys t)
(setq mouse-drag-copy-region t)

;;; Tabs and indent
(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 100
              truncate-lines t)

(setq electric-indent-mode t)

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

;; Load bindings config
(live-load-config-file "bindings.el")

;; Load libs
(require 'xcopypaste)
(require 'misc)
