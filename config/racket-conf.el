(live-add-pack-lib "geiser/elisp")
(live-add-pack-lib "ac-geiser")

(require 'geiser)
(require 'ac-geiser)
(require 'quack)

(require 'eval-in-repl-geiser)
(require 'smartparens-racket)

(add-hook 'geiser-mode-hook
          (lambda ()
            ;; (enable-paredit-mode)
            (yas/minor-mode t)
            (flyspell-prog-mode)
            (linum-mode t)
            (git-gutter-mode t)))

;; From http://emacsredux.com/blog/2013/09/25/removing-key-bindings-from-minor-mode-keymaps/
(defun custom-geiser-mode-hook ()
  (let ((oldmap (cdr (assoc 'cider-mode minor-mode-map-alist)))
        (newmap (make-sparse-keymap)))
    (set-keymap-parent newmap oldmap)

    (define-key newmap (kbd "C-c C-c") 'geiser-eval-definition)
    (define-key newmap (kbd "C-M-x") 'eir-eval-in-geiser)

    (make-local-variable 'minor-mode-overriding-map-alist)
    (push `(geiser-mode . ,newmap) minor-mode-overriding-map-alist)))

(add-hook 'geiser-mode-hook 'custom-geiser-mode-hook)

(add-hook 'geiser-mode-hook #'smartparens-mode)
