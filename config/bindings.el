;;
;; AR config file
;;

;; Define s-SPC, following:
;; http://emacs.stackexchange.com/questions/5705/use-super-in-emacs-nw-in-linux
;;(define-key local-function-key-map "\033[32;16~" [(super ?\ )])

;; Redefining redo/undo
(defalias 'redo 'undo-tree-redo)
(define-key clojure-mode-map (kbd "C-c C-z") nil)
(define-key cider-mode-map (kbd "C-c C-z") nil)
(global-set-key (kbd "C-z") 'undo-tree-undo)
(global-set-key (kbd "C-c C-z") 'redo)

;; Remove because bound by clojure already
(define-key cider-mode-map (kbd "C-M-i") nil)

(global-set-key (kbd "C-v") 'cua-paste)
(global-set-key (kbd "C-c C-o") 'delete-blank-lines)
(global-set-key (kbd "RET") 'advanced-return)
(global-set-key (kbd "s-t") 'transpose-lines)
(global-set-key "\033[32;74~" 'transpose-lines)

; Some Intellj Idea bindings
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-w") 'er/expand-region)

;; auto-complete-mode
(ac-set-trigger-key "TAB")
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(global-set-key (kbd "<backtab>") 'auto-complete)
(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "t" 'ac-expand)

;;; C-c x custom group for enabling stuff
(global-set-key (kbd "C-c x w") 'whitespace-mode)
(global-set-key (kbd "C-c x l") 'linum-mode)
(global-set-key (kbd "C-c x g") 'git-gutter-mode)
(global-set-key (kbd "C-c x p") 'cider-repl-use-pretty-printing)
(global-set-key (kbd "C-c x f") 'global-fci-mode-custom)
(global-set-key (kbd "C-c x s") 'subword-mode)

;;; C-c r custom group for clj-refactor
(cljr-add-keybindings-with-prefix "C-c r")

;;; C-c w custom group for windows
(global-set-key (kbd "C-c w t") 'toggle-window-split)
(global-set-key (kbd "C-c w <up>") 'buf-move-up)
(global-set-key (kbd "C-c w <down>") 'buf-move-down)
(global-set-key (kbd "C-c w <left>") 'buf-move-left)
(global-set-key (kbd "C-c w <right>") 'buf-move-right)

;;; multiple-cursors.el - goes in the C-c t prefix
(global-set-key (kbd "<C-S-mouse-1>") 'mc/add-cursor-on-click) ; works just in a X window
(global-set-key (kbd "<C-next>") 'mc/mark-next-like-this)
(global-set-key (kbd "<C-prior>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-/") 'narrow-or-widen-dwim)
(global-set-key "\033[32;16~" 'set-rectangular-region-anchor)
(global-set-key (kbd "s-SPC") 'set-rectangular-region-anchor)

;; C-c t custom group emacs live - text shortcuts
(global-set-key (kbd "C-c t m a") 'mc/mark-all-like-this-dwim)
(global-set-key (kbd "C-c t d l") 'duplicate-line)

;;; phi-search
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)
(global-set-key (kbd "M-%") 'phi-replace-query)

;;; redefinitions of some Emacs Live bindings
(global-set-key (kbd "C-h") 'help-command)
(define-key org-mode-map (kbd "C-h") 'help-command)
(define-key undo-tree-map (kbd "C-_") 'comment-or-uncomment-region-or-line)
(define-key undo-tree-map (kbd "C-/") 'comment-or-uncomment-region-or-line)
(define-key clojure-mode-map (kbd "C-M-\\") 'live-delete-whitespace-except-one)
(global-set-key (kbd "C-M-.") 'prelude-goto-symbol)

;; Rebind Paredit
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-h") 'help-command)
     (define-key paredit-mode-map (kbd "C-)") 'live-paredit-forward-slurp-sexp-neatly)
     (define-key paredit-mode-map (kbd "C-<right>") 'live-paredit-forward-slurp-sexp-neatly)))

;; gracefully kill emacs --daemon
(global-set-key (kbd "C-x C-M-c") 'save-buffers-kill-emacs)

;; magit shortcuts
(global-set-key (kbd "C-c d s") 'magit-diff-staged)

;; git-gutter shortcuts
(global-set-key (kbd "C-c g u") 'git-gutter:update-all-windows)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)
(global-set-key (kbd "C-c g s") 'git-gutter:stage-hunk)
(global-set-key (kbd "<M-prior>") 'git-gutter:previous-hunk)
(global-set-key (kbd "<M-next>") 'git-gutter:next-hunk)

;; projectile
(global-set-key (kbd "s-d") 'helm-projectile-find-dir)
(global-set-key (kbd "s-p") 'projectile-persp-switch-project)
;; (global-set-key (kbd "s-p") 'projectile-switch-project)
(global-set-key (kbd "s-f") 'helm-projectile-find-file)
(global-set-key (kbd "s-b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "s-.") 'projectile-find-tag)
(global-set-key (kbd "s-s") 'helm-projectile-ag)
(global-set-key (kbd "s-g") 'helm-projectile-grep)
