(live-add-pack-lib "smartparens")

;; Also check
;; https://ebzzry.github.io/emacs-pairs.html
;; https://github.com/Fuco1/.emacs.d/blob/master/files/smartparens.el
(require 'smartparens-config)
(setq smartparens-strict-mode t)

(require 'smartparens)

(defun sp--my-create-newline-and-enter-sexp (&rest _ignored)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))

;; (defun c-only-java-annotations-p (langelem)
;;   "Check if there are only java annotations before the current line.
;; It does this by moving across the region from the start of
;; LANGELEM to the beginning of this line one sexp at a time.  If
;; during this traversal, this function only sees whitespaces
;; followed by either a '@' or a '(' then it returns t."
;;   (save-excursion
;;     (condition-case err ;; return nil if  any errors are thrown by forward-sexp
;;         (let* ((lim (1- (c-point 'bol)))
;;                (throws (catch 'notAnno
;;                          (goto-char (cdr langelem))
;;                          (while (< (point) lim)
;;                            (if (not (looking-at "\\(\\s \\|\n\\)*\\(@\\|(\\)"))
;;                                (throw 'notAnno t))
;;                            (forward-sexp 1)))))
;;           (if (not throws)
;;               t)))))

;; (defun sp-next-top-level-form ()
;;   (interactive)
;;   (while (ignore-errors (sp-baparedit-backward-up) t))
;;   (live-paredit-forward))

;; (defun sp-previous-top-level-form ()
;;   (interactive)
;;   (if (or (ignore-errors (paredit-backward-up) t)
;;           (c-only-java-annotations-p))

;;       (while (ignore-errors (paredit-backward-up) t))
;;     (paredit-backward)))

(sp-with-modes '(c-mode c++-mode js-mode js2-mode java-mode typescript-mode perl-mode)
  (sp-local-pair "{" nil :post-handlers
                 '((sp--my-create-newline-and-enter-sexp "RET"))))
