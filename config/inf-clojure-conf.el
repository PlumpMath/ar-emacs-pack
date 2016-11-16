(live-add-pack-lib "inf-clojure")
(require 'inf-clojure)

(add-hook 'inf-clojure-mode-hook #'eldoc-mode)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(setq inf-clojure-program '("localhost" . "5555"))
