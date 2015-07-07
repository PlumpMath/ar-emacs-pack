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
     (go-loop 'defun)
     (defprotocol 'defun)
     (defrecord 'defun)
     (deftype 'defun)
     (defroutes 'defun)
     (defroutes 'defun)
     (GET 2)
     (POST 2)
     (PUT 2)
     (DELETE 2)
     (HEAD 2)
     (ANY 2)
     (context 2)))

(add-to-list 'auto-mode-alist '("\\.\\(cljc|cljs\\|dtm\\|edn\\)$" . clojure-mode))

(live-add-pack-lib "clojure-snippets")
(require 'clojure-snippets)

;; clj-refactor
(setq cljr-favor-prefix-notation nil)

;; clojure hooks
(add-hook 'clojure-mode-hook
          (lambda ()
            (yas/minor-mode t)
            (flyspell-prog-mode)
            (linum-mode t)
            (git-gutter-mode t)))
