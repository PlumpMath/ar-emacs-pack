(live-add-pack-lib "zeal-at-point")
(require 'zeal-at-point)

(add-to-list 'zeal-at-point-mode-alist '(clojure-mode . "java"))
(add-to-list 'zeal-at-point-mode-alist '(clojurescript-mode . ("clojurescript" "svg" "nodejs")))
