;;; misc.el ---Set of useful functions

;; From: http://stackoverflow.com/questions/20041904/eclipse-like-line-commenting-in-emacs#answer-20064658
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let ((start (line-beginning-position))
        (end (line-end-position)))
    (when (or (not transient-mark-mode) (region-active-p))
      (setq start (save-excursion
                    (goto-char (region-beginning))
                    (beginning-of-line)
                    (point))
            end (save-excursion
                  (goto-char (region-end))
                  (end-of-line)
                  (point))))
    (comment-or-uncomment-region start end))
  (next-line))

;; From: http://www.bytopia.org/2014/11/26/rename-clojure-symbol-in/
(defun narrow-or-widen-dwim (p)
  "If the buffer is narrowed, it widens. Otherwise, it narrows intelligently.
   Intelligently means: region, subtree, or defun, whichever applies
   first.

   With prefix P, don't widen, just narrow even if buffer is already
   narrowed."
  (interactive "P")
  (declare (interactive-only))
  (cond ((and (buffer-narrowed-p) (not p)) (widen))
        ((region-active-p)
         (narrow-to-region (region-beginning) (region-end)))
        ((derived-mode-p 'org-mode) (org-narrow-to-subtree))
        (t (narrow-to-defun))))

;; From: http://stackoverflow.com/questions/1167484/how-to-gracefully-shutdown-emacs-daemon
(defun shutdown-emacs-server ()
  (interactive)
  (when (not (eq window-system 'x))
    (message "Initializing x windows system.")
    (x-initialize-window-system)
    (when (not x-display-name) (setq x-display-name (getenv "DISPLAY")))
    (select-frame (make-frame-on-display x-display-name '((window-system . x))))
  )
  (let ((last-nonmenu-event nil)(window-system "x"))(save-buffer)))

(provide 'misc)

;;; misc.el ends here
