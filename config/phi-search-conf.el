(live-add-pack-lib "phi-search")
(require 'phi-search)
(require 'phi-replace)

(define-key phi-search-default-map (kbd "<prior>") 'phi-search-again-or-previous)
(define-key phi-search-default-map (kbd "<next>") 'phi-search-again-or-next)

(set-face-attribute 'phi-search-selection-face nil
                    :background "#08161a")

(set-face-attribute 'phi-search-match-face nil
                    :background "#194854")

(setq phi-search-limit           10000)
(setq phi-search-case-sensitive 'guess)
