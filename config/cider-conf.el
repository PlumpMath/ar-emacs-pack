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
