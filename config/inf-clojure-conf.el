(live-add-pack-lib "inf-clojure")
(require 'inf-clojure)
(autoload 'inf-clojure "inf-clojure" "Run an inferior Clojure process" t)

(add-hook 'inf-clojure-mode-hook #'eldoc-mode)
(add-hook 'inf-clojure-mode-hook #'paredit-mode)
(add-hook 'inf-clojure-mode-hook #'subword-mode)

(add-hook 'inf-clojure-minor-mode-hook #'paredit-mode)
(add-hook 'inf-clojure-minor-mode-hook #'subword-mode)
(add-hook 'inf-clojure-minor-mode-hook #'eldoc-mode)
