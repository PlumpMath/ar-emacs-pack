(define-clojure-indent
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
  (context 2)
  (async 'defun)
  (eval-str 'defun)
  (deftask 'defun)
  (start 'defun)
  (stop 'defun)
  (read-eval-call-test 'defun)
  (alet 'defun)
  (mlet 'defun)
  (eval-in 'defun)               ;; classlojure
  (trace-forms (lambda (_ _) 0)) ;; re-frame macros
  (fdef 'defun))

(live-add-pack-lib "clojure-snippets")
(require 'clojure-snippets)

;; replz
(setq nrepl-buffer-name-show-port t)

;; clojure hooks
(add-hook 'clojure-mode-hook
          (lambda ()
            (yas/minor-mode t)
            (flyspell-prog-mode)
            (linum-mode t)
            (git-gutter-mode t)
            (eldoc-mode)
            (subword-mode)))

(live-add-pack-lib "html-to-hiccup")
(require 'html-to-hiccup)
