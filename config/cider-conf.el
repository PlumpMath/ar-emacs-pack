(require 'eval-in-repl-cider)

;; (setq cider-show-error-buffer nil)
;; (setq cider-show-error-buffer 'except-in-repl)
(setq cider-show-error-buffer 'only-in-repl)
(setq cider-stacktrace-fill-column 100)
(setq cider-repl-history-size 1000)
(setq cider-prompt-for-project-on-connect nil)
(setq cider-repl-display-help-banner nil)
(setq cider-connection-message-fn 'cider-random-tip)
(setq cider-use-tooltips nil)
(setq cider-prompt-for-symbol nil)
(setq cider-auto-mode nil) ;; I want to use inf-clojure as well

;; Known hosts
(setq cider-known-endpoints '(("localhost" "5055") ("localhost" "5088")))

;; clj-refactor
(setq cljr-favor-prefix-notation nil)
(setq cljr-magic-requires nil)

(add-hook 'cider-repl-mode-hook #'subword-mode)
(add-hook 'cider-mode-hook #'subword-mode)

;; ac-cider
(add-hook 'cider-mode-hook 'ac-flyspell-workaround)
(add-hook 'cider-mode-hook 'ac-cider-setup)
(add-hook 'cider-repl-mode-hook 'ac-cider-setup)
(eval-after-load "auto-complete"
  '(progn
     (add-to-list 'ac-modes 'cider-mode)
     (add-to-list 'ac-modes 'cider-repl-mode)))

(defcustom cider-repl-refresh-after 'dev/go
  "Symbol of a function that will be executed after
  clojure.tools.namespace.repl/refresh."
  :type 'string
  :group 'cider)

(defcustom cider-repl-refresh-and-test-regex ".*-test$"
  "String regex that will be used for fetching the tests from the
  classpath after clojure.tools.namespace.repl/refresh."
  :type 'string
  :group 'cider)

(defun cider-figwheel-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'figwheel-sidecar.repl-api)
             (figwheel-sidecar.repl-api/start-figwheel!)
             (figwheel-sidecar.repl-api/cljs-repl)")
    (cider-repl-return)))

(defun cider-boot-cljs-repl ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "((eval 'adzerk.boot-cljs-repl/start-repl))")
    (cider-repl-return)))

(defun cider-repl-reload-dev ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'dev :reload)")
    (cider-repl-return)))

(defun cider-repl-refresh-and-test ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert (concat "(require 'clojure.tools.namespace.repl
  'clojure.tools.namespace.find
  'clojure.java.classpath) "
                    "(clojure.tools.namespace.repl/refresh :after "
                    "'" (symbol-name cider-repl-refresh-after) ") "
                    "(let [test-namespaces (->> (clojure.java.classpath/classpath)
   (clojure.tools.namespace.find/find-namespaces)
   (filter #(re-find #\"" cider-repl-refresh-and-test-regex "\" (str %))))]
     (run! require test-namespaces)
     (apply test/run-tests test-namespaces))"))
    (cider-repl-return)))

(defun cider-repl-refresh ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert (concat "(require 'clojure.tools.namespace.repl) "
                    "(clojure.tools.namespace.repl/refresh :after "
                    "'" (symbol-name cider-repl-refresh-after) ")"))
    (cider-repl-return)))

(defun cider-repl-in-ns-dev ()
  (interactive)
  (save-some-buffers)
  (with-current-buffer (cider-current-repl-buffer)
    (goto-char (point-max))
    (insert "(require 'dev) (in-ns 'dev)")
    (cider-repl-return)))

(global-set-key (kbd "s-r") 'cider-repl-refresh)
(global-set-key (kbd "C-s-r") 'cider-repl-refresh-and-test)
(global-set-key (kbd "C-c r l") 'cider-repl-reload-dev)
(global-set-key (kbd "C-c r d") 'cider-repl-in-ns-dev)
(global-set-key (kbd "C-c r f") 'cider-figwheel-repl)
(global-set-key (kbd "C-c r b") 'cider-boot-cljs-repl)

;; From http://emacsredux.com/blog/2013/09/25/removing-key-bindings-from-minor-mode-keymaps/
(defun custom-cider-mode-hook ()
  (let ((oldmap (cdr (assoc 'cider-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)

    (define-key newmap (kbd "C-c C-z") nil)
    (define-key newmap (kbd "C-c C-a") 'cider-switch-to-repl-buffer)
    (define-key newmap (kbd "C-M-x") 'eir-eval-in-cider)

    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(cider-mode . ,newmap) minor-mode-overriding-map-alist)))

(add-hook 'cider-mode-hook 'custom-cider-mode-hook)

(live-add-pack-lib "helm-cider")
(require 'helm-cider)
(helm-cider-mode 1)
