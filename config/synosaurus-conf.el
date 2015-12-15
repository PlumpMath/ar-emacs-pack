(live-add-pack-lib "synosaurus")
(require 'synosaurus)
(require 'synosaurus-wordnet)

(setq synosaurus-backend 'synosaurus-backend-wordnet)

(add-hook 'text-mode-hook 'synosaurus-mode)
