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
(global-set-key (kbd "M-[ M-DEL") 'paredit-kill-parent-sexp)

;; Some Intellj Idea bindings
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-w") 'er/expand-region)

;; auto-complete-mode
(ac-set-trigger-key "TAB")
(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
(global-set-key (kbd "<backtab>") 'auto-complete)
(define-key ac-complete-mode-map "\r" 'ac-complete)
(define-key ac-complete-mode-map "t" 'ac-expand)

;;; C-c x custom group for enabling modes
(global-set-key (kbd "C-c x w") 'whitespace-mode)
(global-set-key (kbd "C-c x l") 'linum-mode)
(global-set-key (kbd "C-c x g") 'git-gutter-mode)
(global-set-key (kbd "C-c x f") 'global-fci-mode-custom)
(global-set-key (kbd "C-c x s") 'subword-mode)

;;; C-c custom commands
(global-set-key (kbd "C-c r p p") 'cider-repl-use-pretty-printing)
(global-set-key (kbd "C-c w c") 'whitespace-cleanup)

;;; clj-refactor - C-c r
(cljr-add-keybindings-with-prefix "C-c r")
(global-set-key (kbd "C-M-[") 'cljr-cycle-coll)
(global-set-key (kbd "C-M-]") 'cljr-promote-function)

;;; C-c w custom group for windows
(global-set-key (kbd "C-c w t") 'toggle-window-split)
(global-set-key (kbd "C-c w s") 'resize-window)
(global-set-key (kbd "C-c w <up>") 'buf-move-up)
(global-set-key (kbd "C-c w <down>") 'buf-move-down)
(global-set-key (kbd "C-c w <left>") 'buf-move-left)
(global-set-key (kbd "C-c w <right>") 'buf-move-right)
(global-set-key (kbd "C-c w o <prior>") 'scroll-other-window-down)
(global-set-key (kbd "C-c w o <next>") 'scroll-other-window)

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
(global-set-key (kbd "C-c t d s") 'paredit-duplicate-closest-sexp)
 ;; better twice because I often forget
(global-set-key (kbd "C-c t t s") 'clojure-toggle-keyword-string)
(global-set-key (kbd "C-c t t k") 'clojure-toggle-keyword-string)

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
(define-key cider-mode-map (kbd "C-c M-x") 'cider-eval-sexp-at-point-in-repl)


;; Rebind Paredit
(eval-after-load 'paredit
  '(progn
     (define-key paredit-mode-map (kbd "C-h") 'help-command)
     (define-key paredit-mode-map (kbd "M-(") 'paredit-wrap-round)
     (define-key paredit-mode-map (kbd "M-)") 'paredit-wrap-round-from-behind)
     (define-key paredit-mode-map (kbd "C-<right>") 'live-paredit-forward-slurp-sexp-neatly)
     (define-key paredit-mode-map (kbd "M-<up>") 'live-paredit-previous-top-level-form)
     (define-key paredit-mode-map (kbd "M-<down>") 'live-paredit-next-top-level-form)
     (define-key paredit-mode-map (kbd "M-SPC ") 'live-paredit-tidy-trailing-parens)))

;; Rebind Smartparens
;; Also check
;; https://ebzzry.github.io/emacs-pairs.html
;; https://github.com/Fuco1/.emacs.d/blob/master/files/smartparens.el
(eval-after-load 'smartparens
  '(progn
     (define-key smartparens-mode-map (kbd "C-<right>") 'sp-forward-slurp-sexp)
     (define-key smartparens-mode-map (kbd "M-<rigth>") 'sp-backward-slurp-sexp)
     (define-key smartparens-mode-map (kbd "C-<left>") 'sp-backward-slurp-sexp)
     (define-key smartparens-mode-map (kbd "M-<left>") 'sp-backward-barf-sexp)))

;; gracefully kill emacs --daemon
(global-set-key (kbd "C-x C-M-c") 'save-buffers-kill-emacs)

;; (ma)git shortcuts
(global-set-key (kbd "C-c d s") 'magit-diff-staged)
(define-key magit-status-mode-map (kbd "q") 'magit-quit-session)
(global-set-key (kbd "C-c g b") 'browse-at-remote/browse)
(global-set-key (kbd "C-c g k") 'browse-at-remote/kill)

;; git-gutter shortcuts
(global-set-key (kbd "C-c g u") 'git-gutter:update-all-windows)
(global-set-key (kbd "C-c g r") 'git-gutter:revert-hunk)
(global-set-key (kbd "C-c g s") 'git-gutter:stage-hunk)
(global-set-key (kbd "<M-prior>") 'git-gutter:previous-hunk)
(global-set-key (kbd "<M-next>") 'git-gutter:next-hunk)
(global-set-key (kbd "C-c g d") 'git-gutter:popup-hunk)

;; projectile
(global-set-key (kbd "s-d") 'helm-projectile-find-dir)
(global-set-key (kbd "s-p") 'projectile-persp-switch-project)
(global-set-key (kbd "s-f") 'helm-projectile-find-file)
(global-set-key (kbd "s-b") 'helm-projectile-switch-to-buffer)
(global-set-key (kbd "s-.") 'projectile-find-tag)
(global-set-key (kbd "s-s") 'helm-projectile-ag)
(global-set-key (kbd "s-g") 'helm-projectile-grep)
(global-set-key (kbd "s-M-t") 'projectile-toggle-between-implementation-and-test)

;; Zeal
(define-key cider-doc-map (kbd "z") 'zeal-at-point)
(global-set-key (kbd "C-c C-d z") 'zeal-at-point)

;; Org
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
