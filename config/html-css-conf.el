(live-add-pack-lib "scss-mode")

(require 'scss-mode)
(require 'live-fontify-hex)

(setq scss-compile-at-save nil)

(add-hook 'scss-mode-hook 'auto-complete-mode)
(add-hook 'scss-mode-hook 'flyspell-mode)

(font-lock-add-keywords 'scss-mode
                        '((live-fontify-hex-colors)))

(add-hook 'html-mode-hook #'smartparens-strict-mode)
(add-hook 'css-mode-hook #'smartparens-strict-mode)
(add-hook 'scss-mode-hook #'smartparens-strict-mode)
