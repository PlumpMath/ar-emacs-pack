;;
;; AR config file
;;
(defalias 'redo 'undo-tree-redo)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'redo)
(global-set-key (kbd "C-y") 'kill-whole-line)
(global-set-key (kbd "C-v") 'cua-paste)
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)

;; C-c custom group for enabling modes
(global-set-key (kbd "C-c x w") 'whitespace-mode)
(global-set-key (kbd "C-c x l") 'linum-mode)
(global-set-key (kbd "C-c x g") 'git-gutter-mode)

;; For example:
;;(define-key global-map (kbd "C-+") 'text-scale-increase)
;;(define-key global-map (kbd "C--") 'text-scale-decrease)
