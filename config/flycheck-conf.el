(live-add-pack-lib "let-alist")
(live-add-pack-lib "flycheck")
(live-add-pack-lib "pos-tip")
(live-add-pack-lib "flycheck-pos-tip")

(require 'let-alist)
(require 'pos-tip)
(require 'flycheck-pos-tip)
(require 'flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(eval-after-load 'flycheck
  '(setq flycheck-display-errors-function #'flycheck-pos-tip-error-messages))
