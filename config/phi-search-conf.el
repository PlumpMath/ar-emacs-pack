(live-add-pack-lib "phi-search")
(require 'phi-search)
(require 'phi-replace)

(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)
(global-set-key (kbd "M-%") 'phi-replace-query)
