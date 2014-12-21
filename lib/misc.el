;;; misc.el ---Set of useful functions

(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  ;; (interactive)
  ;; (let (beg end)
  ;; (if (region-active-p)
  ;; (setq beg (region-beginning) end (region-end))
  ;; (setq beg (line-beginning-position) end (line-end-position)))
  ;; (comment-or-uncomment-region beg end)
  ;; (next-line)))
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

(provide 'misc)
;;; misc.el ends here
