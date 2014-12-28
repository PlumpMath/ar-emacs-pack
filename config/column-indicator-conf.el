(require 'fill-column-indicator)

(define-globalized-minor-mode global-fci-mode-custom fci-mode turn-on-fci-mode)
(global-fci-mode-custom 1)
