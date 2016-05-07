(live-add-pack-lib "scss-mode")
(live-add-pack-lib "tagedit")

(require 'scss-mode)
(require 'live-fontify-hex)

(setq scss-compile-at-save nil)

(add-hook 'scss-mode-hook 'auto-complete-mode)
(add-hook 'scss-mode-hook 'flyspell-mode)

(font-lock-add-keywords 'scss-mode
                        '((live-fontify-hex-colors)))

;; (add-hook 'html-mode-hook #'smartparens-strict-mode)
(add-hook 'css-mode-hook #'smartparens-strict-mode)
(add-hook 'scss-mode-hook #'smartparens-strict-mode)

(eval-after-load "sgml-mode"
  '(progn
     (require 'tagedit)
     (tagedit-add-paredit-like-keybindings)
     (add-hook 'html-mode-hook (lambda ()
                                 (tagedit-mode 1)
                                 (tagedit-add-experimental-features)))))
