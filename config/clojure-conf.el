(eval-after-load 'clojure-mode
  '(define-clojure-indent
     (fold 'defun)
     (pfold 'defun)
     (pdoseq 1)
     (slice 'defun)
     (for-all 1)
     (describe 'defun)
     (testing 'defun)
     (given 'defun)
     (using 'defun)
     (with 'defun)
     (it 'defun)
     (do-it 'defun)
     (go-loop 'defun)))

(add-to-list 'auto-mode-alist '("\\.\\(cljc|cljs\\|dtm\\|edn\\)$" . clojure-mode))

(live-add-pack-lib "clojure-snippets")
(require 'clojure-snippets)
