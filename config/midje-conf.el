(live-add-pack-lib "midje-mode")

(require 'midje-mode)
(require 'clojure-jump-to-file)

(add-hook 'clojure-mode-hook 'midje-mode)
