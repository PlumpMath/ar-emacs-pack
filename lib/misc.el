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
  (forward-line))

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

(defun duplicate-line (arg)
  "Duplicate current line, leaving point in lower line."
  (interactive "*p")

  ;; save the point for undo
  (setq buffer-undo-list (cons (point) buffer-undo-list))

  ;; local variables for start and end of line
  (let ((bol (save-excursion (beginning-of-line) (point)))
        eol)
    (save-excursion

      ;; don't use forward-line for this, because you would have
      ;; to check whether you are at the end of the buffer
      (end-of-line)
      (setq eol (point))

      ;; store the line and disable the recording of undo information
      (let ((line (buffer-substring bol eol))
            (buffer-undo-list t)
            (count arg))
        ;; insert the line arg times
        (while (> count 0)
          (newline)         ;; because there is no newline in 'line'
          (insert line)
          (setq count (1- count)))
        )

      ;; create the undo information
      (setq buffer-undo-list (cons (cons eol (point)) buffer-undo-list)))
    ) ; end-of-let

  ;; put the point in the lowest line and return
  (forward-line arg))

(defun advanced-return (&optional arg)
  (interactive "P")
  (cond ((equal arg '-) ;; C--
         (beginning-of-line)
         (open-line 1))
        ((equal arg '(4)) ;; C-u
         (end-of-line)
         (open-line 1)
         (forward-line))
        (t ;; Otherwise
         (newline-and-indent))))

;; http://www.emacswiki.org/emacs/WindowResize
(defun resize-window (&optional arg)    ; Hirose Yuuji and Bob Wiener
  "*Resize window interactively."
  (interactive "p")
  (if (one-window-p) (error "Cannot resize sole window"))
  (or arg (setq arg 1))
  (let (c)
    (catch 'done
      (while t
	(message
	 "h=heighten, s=shrink, w=widen, n=narrow (by %d);  1-9=unit, q=quit"
	 arg)
	(setq c (read-char))
	(condition-case ()
	    (cond
	     ((= c ?h) (enlarge-window arg))
	     ((= c ?s) (shrink-window arg))
	     ((= c ?w) (enlarge-window-horizontally arg))
	     ((= c ?n) (shrink-window-horizontally arg))
	     ((= c ?\^G) (keyboard-quit))
	     ((= c ?q) (throw 'done t))
	     ((and (> c ?0) (<= c ?9)) (setq arg (- c ?0)))
	     (t (beep)))
	  (error (beep)))))
    (message "Done.")))

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

;; needed for prelude-goto-symbol
(require 'imenu)

(defun prelude-goto-symbol (&optional symbol-list)
  "Refresh imenu and jump to a place in the buffer using Ido."
  (interactive)
  (cond
   ((not symbol-list)
    (let (name-and-pos symbol-names position)
      (while (progn
               (imenu--cleanup)
               (setq imenu--index-alist nil)
               (prelude-goto-symbol (imenu--make-index-alist))
               (setq selected-symbol
                     (completing-read "Symbol? " (reverse symbol-names)))
               (string= (car imenu--rescan-item) selected-symbol)))
      (unless (and (boundp 'mark-active) mark-active)
        (push-mark nil t nil))
      (setq position (cdr (assoc selected-symbol name-and-pos)))
      (cond
       ((overlayp position)
        (goto-char (overlay-start position)))
       (t
        (goto-char position)))
      (recenter)))
   ((listp symbol-list)
    (dolist (symbol symbol-list)
      (let (name position)
        (cond
         ((and (listp symbol) (imenu--subalist-p symbol))
          (prelude-goto-symbol symbol))
         ((listp symbol)
          (setq name (car symbol))
          (setq position (cdr symbol)))
         ((stringp symbol)
          (setq name symbol)
          (setq position
                (get-text-property 1 'org-imenu-marker symbol))))
        (unless (or (null position) (null name)
                    (string= (car imenu--rescan-item) name))
          (add-to-list 'symbol-names (substring-no-properties name))
          (add-to-list 'name-and-pos (cons (substring-no-properties name) position))))))))

;; Teach compile the syntax of the kibit output
(require 'compile)
(add-to-list 'compilation-error-regexp-alist-alist
         '(kibit "At \\([^:]+\\):\\([[:digit:]]+\\):" 1 2 nil 0))
(add-to-list 'compilation-error-regexp-alist 'kibit)

;; A convenient command to run "lein kibit" in the project to which
;; the current emacs buffer belongs to.
(defun kibit ()
  "Run kibit on the current project.
   Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile "lein kibit"))

(defun kibit-current-file ()
  "Run kibit on the current file.
   Display the results in a hyperlinked *compilation* buffer."
  (interactive)
  (compile (concat "lein kibit " buffer-file-name)))

(defun goto-messages-buffer ()
  (interactive)
  (switch-to-buffer "*Messages*"))

;; From https://github.com/halgari/clojure-conj-2013-core.async-examples
;; (defun nrepl-eval-sexp-at-point-in-repl ()
;;   (interactive)
;;   (let ((form (nrepl-expression-at-point)))
;;     ;; Strip excess whitespace
;;     (while (string-match "\\`\s+\\|\n+\\'" form)
;;       (setq form (replace-match "" t t form)))
;;     (set-buffer (nrepl-find-or-create-repl-buffer))
;;     (goto-char (point-max))
;;     (insert form)
;;     (nrepl-return)))

;; If you are using CIDER below is the equivalent.
(defun cider-eval-sexp-at-point-in-repl ()
  (interactive)
  (let ((form (cider-sexp-at-point)))
    ;; Strip excess whitespace
    (while (string-match "\\`\s+\\|\n+\\'" form)
      (setq form (replace-match "" t t form)))
    (set-buffer (cider-get-repl-buffer))
    (goto-char (point-max))
    (insert form)
    (cider-repl-return)))

;; If you are using Cask for your Emacs configuration, add this to your ~/.emacs.d/init.el file:
;; (defun cask-init ()
;;   (interactive)
;;   (let ((cask-exe "~/.cask/cask.el"))
;;     (if (file-exists-p cask-exe)
;;         (progn
;;           (require 'cask cask-exe)
;;           (cask-initialize))
;;       (message "Warning: ~/.cask/cask.el not found."))))

(provide 'misc)

;;; misc.el ends here
