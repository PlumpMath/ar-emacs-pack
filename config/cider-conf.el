;; (setq cider-show-error-buffer nil)
;; (setq cider-show-error-buffer 'except-in-repl)
(setq cider-show-error-buffer 'only-in-repl)

(setq nrepl-buffer-name-show-port t)
(setq cider-stacktrace-fill-column 100)
(setq cider-repl-history-size 1000)

;; Known hosts
(setq cider-known-endpoints '(("localhost" "5055")))

(add-hook 'cider-repl-mode-hook #'subword-mode)

;; ac-cider
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

;; From https://github.com/juxt/jig
;; (defun nrepl-reset ()
;;   (interactive)
;;   (save-some-buffers)
;;   (set-buffer "*nrepl*")
;;   (goto-char (point-max))
;;   (insert "(user/reset)")
;;   (nrepl-return))

;; (global-set-key (kbd "C-c r") 'nrepl-reset)

;; From https://github.com/juxt/jig
(defun cider-repl-reset ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(user/reset)")
    (cider-repl-return)))

;; From https://github.com/stuartsierra/dotfiles
(defun cider-refresh ()
  (interactive)
  (save-some-buffers t 'clj-file-p)
  (cider-interactive-eval
   "(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)"))

(global-set-key (kbd "M-s-r") 'cider-refresh)
(global-set-key (kbd "s-r") 'cider-repl-reset)
