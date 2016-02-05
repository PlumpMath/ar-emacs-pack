(require 'cider-grimoire)
(require 'cider-test)

;; (setq cider-show-error-buffer nil)
;; (setq cider-show-error-buffer 'except-in-repl)
(setq cider-show-error-buffer 'only-in-repl)

(setq nrepl-buffer-name-show-port t)
(setq cider-stacktrace-fill-column 100)
(setq cider-repl-history-size 1000)
(setq cider-prompt-for-project-on-connect nil)

;; Known hosts
(setq cider-known-endpoints '(("localhost" "5055") ("localhost" "5088")))

(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-mode-hook #'subword-mode)

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

(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(defun cider-boot-cljs-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "((eval 'adzerk.boot-cljs-repl/start-repl))")
    (cider-repl-return)))

(global-set-key (kbd "M-s-r") 'cider-refresh)
(global-set-key (kbd "s-r") 'cider-repl-reset)
(global-set-key (kbd "C-c r f") 'cider-figwheel-repl)
(global-set-key (kbd "C-c r b") 'cider-boot-cljs-repl)

;; From http://emacsredux.com/blog/2013/09/25/removing-key-bindings-from-minor-mode-keymaps/

(defun custom-cider-mode-hook ()
  (let ((oldmap (cdr (assoc 'cider-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)
    (define-key newmap (kbd "C-c C-z") nil)
    (define-key newmap (kbd "C-c C-a") 'cider-switch-to-repl-buffer)
    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(cider-mode . ,newmap) minor-mode-overriding-map-alist)))

(add-hook 'cider-mode-hook 'custom-cider-mode-hook)
