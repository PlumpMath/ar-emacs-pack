(live-add-pack-lib "string-edit.el")
(require 'string-edit)

(live-add-pack-lib "golden-ratio.el")
(require 'golden-ratio)
(golden-ratio-mode 1)
(setq golden-ratio-auto-scale t)
(setq golden-ratio-exclude-modes '("ediff-mode"))

(defun ielm-auto-complete ()
  "Enables `auto-complete' support in \\[ielm]."
  (setq ac-sources '(ac-source-functions
                     ac-source-variables
                     ac-source-features
                     ac-source-symbols
                     ac-source-words-in-same-mode-buffers))
  (add-to-list 'ac-modes 'inferior-emacs-lisp-mode)
  (auto-complete-mode 1))
(add-hook 'ielm-mode-hook 'ielm-auto-complete)

;; Some common vars that I can safely configure
(put 'projectile-project-compilation-cmd 'safe-local-variable #'stringp)
(put 'compilation-read-command 'safe-local-variable #'string-or-null-p)

;; Aliases in shell-command
;; http://stackoverflow.com/questions/10946219/emacs-compilation-mode-wont-see-bash-alias#10958134
;; (setq shell-file-name "bash")
;; (setq shell-command-switch "-ic")

(live-add-pack-lib "exec-path-from-shell")
(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
