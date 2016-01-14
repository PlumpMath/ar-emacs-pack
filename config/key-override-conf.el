;; From:
;; https://stackoverflow.com/questions/12905017/rebinding-keys-in-orgmode

(defvar ar-keys-mode-map
  (let ((m (make-sparse-keymap)))
    ;; I prefer kill-whole-line for C-y
    (define-key m (kbd "C-y") 'kill-whole-line)
    (define-key m (kbd "C-M-y") 'org-yank)
    ;; (local-set-key "\M-n" 'outline-next-visible-heading)
    ;; (local-set-key "\M-p" 'outline-previous-visible-heading)
    ;; table
    ;; (define-key org-mode-map "\C-\M-w" 'org-table-copy-region)
    ;; (define-key org-mode-map "\C-\M-y" 'org-table-paste-rectangle)
    ;; (define-key org-mode-map "\C-\M-l" 'org-table-sort-lines)
    ;; display images
    ;; (local-set-key "\M-I" 'org-toggle-iimage-in-org)
    m) "ar-keys-mode keymap.")

(define-minor-mode ar-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " ar-keys")

(ar-keys-mode 1)

(defun my-minibuffer-setup-hook ()
  (ar-keys-mode 0))

(add-hook 'minibuffer-setup-hook 'my-minibuffer-setup-hook)

;; (defadvice load (after give-my-keybindings-priority)
;; "Try to ensure that my keybindings always have priority."
;; (if (not (eq (car (car minor-mode-map-alist)) 'ar-keys-mode))
;; (let ((ks (assq 'ar-keys-mode minor-mode-map-alist)))
;; (assq-delete-all 'ar-keys-mode minor-mode-map-alist)
;; (add-to-list 'minor-mode-map-alist ks))))

;; (ad-activate 'load)
