;;
;; AR config file
;;

;; Define s-SPC, following:
;; http://emacs.stackexchange.com/questions/5705/use-super-in-emacs-nw-in-linux
(define-key local-function-key-map "\033[32;16~" [(super ?\ )])

;; Some Intellj Idea bindings
(defalias 'redo 'undo-tree-redo)
(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-Z") 'redo)
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-v") 'cua-paste)
(global-set-key (kbd "C-w") 'er/expand-region)

;; My auto-complete-mode
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
(global-set-key (kbd "C-c x p") 'paredit-mode)
(global-set-key (kbd "C-c x f") 'global-fci-mode-custom)

;;; C-c r custom group for clj-refactor
(cljr-add-keybindings-with-prefix "C-c r")

;;; My multiple-cursors.el
(global-set-key (kbd "<C-S-mouse-1>") 'mc/add-cursor-on-click) ; works just in a X window
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-a") 'mc/mark-all-dwim)
(global-set-key (kbd "M-/") 'narrow-or-widen-dwim)
(global-set-key "\033[32;16~" 'set-rectangular-region-anchor)

;;; My phi-search
(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)
(global-set-key (kbd "M-%") 'phi-replace-query)

;;; My redefinitions of some Emacs Live bindings
(global-set-key (kbd "C-h") 'help-command)
(define-key org-mode-map (kbd "C-h") 'help-command)
(define-key paredit-mode-map (kbd "C-h") 'help-command)
(define-key undo-tree-map (kbd "C-_") 'comment-or-uncomment-region-or-line)
(define-key undo-tree-map (kbd "C-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "C-x C-M-c") 'save-buffers-kill-emacs)

;; My diff shortcuts
(global-set-key (kbd "C-c d s") 'magit-diff-staged)
