(require 'org-protocol)

(add-hook 'org-mode-hook 'org-indent-mode) ;; indenting

;; http://orgmode.org/worg/org-configs/org-customization-guide.html
;; https://github.com/robertutterback/config/blob/master/emacs/org-mode.org
;; http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner/

(setq org-directory (concat "~/git/" "ar-org"))
(setq org-default-notes-file (concat org-directory "/agenda/notes.org.gpg"))
(setq org-archive-location (concat org-directory "/archive/archive.org.gpg" "::datetree/* From %s")) ;; Filename::heading
(setq org-agenda-files (list (concat org-directory "/agenda/notes.org.gpg")
                             (concat org-directory "/agenda/work.org.gpg")
                             (concat org-directory "/agenda/home.org.gpg")))
(setq org-clock-persist-file (concat live-current-pack-dir "org-clock-save.el"))

(setq org-agenda-include-diary t)
(setq org-reverse-note-order t)
(setq org-return-follows-link t)
(setq org-log-done t)
(setq org-fast-tag-selection-single-key 'expert)
(setq org-catch-invisible-edits 'show)

;;;;;;;;;;;;;;
;;  Refile  ;;
;;;;;;;;;;;;;;

;; (setq org-refile-targets
;; '((nil :maxlevel . 2)
;; (org-agenda-files :maxlevel . 2)))

(defun get-open-org-file ()
(buffer-file-name
(get-buffer
 (org-icompleting-read "Buffer: "
                       (mapcar 'buffer-name
                               (org-buffer-list 'files))))))
(setq org-refile-targets '((get-open-org-file . (:maxlevel . 2))))

(setq org-refile-use-outline-path 'file)
(setq org-completion-use-ido t)

;;;;;;;;;;;;;;;;;
;;;  Capture  ;;;
;;;;;;;;;;;;;;;;;

(setq org-capture-templates
      '(("a" "Article/video to read/watch"
         entry
         (file (concat org-directory "/agenda/notes.org.gpg"))
         "* %U\n%?\n" :clock-resume t)

        ("b" "Blog idea"
         entry
         (file (concat org-directory "/agenda/notes.org.gpg"))
         "* TODO %^{Brief Description}\n%?\nAdded: %U" :clock-resume t)

        ("m" "Meeting/Call"
         entry
         (file (concat org-directory "/agenda/work.org.gpg"))
         "* MEETING %^{Name} :MEETING:\n%?\n" :clock-in t :clock-resume t)

        ("e" "Email"
         entry
         (file (concat org-directory "/agenda/notes.org.gpg"))
         "* TODO %^{Title}\n  Source: %u, %c\n\n  %i" :clock-in t :clock-resume t)

        ("r" "Respond to"
         entry
         (file "/agenda/notes.org.gpg")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)

        ("n" "Note, snippet, word or fact"
         entry
         (file (concat org-directory "/agenda/notes.org.gpg"))
         "* %? :NOTE:\n%a\nAdded: %U" :clock-in t :clock-resume t)

        ("w" "Work Todo"
         entry
         (file (concat org-directory "/agenda/work.org.gpg"))
         "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" :clock-resume t)

        ("t" "Todo"
         entry
         (file (concat org-directory "/agenda/notes.org.gpg"))
         "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" :clock-resume t)))

;;;;;;;;;;;;;;;;
;;;  AGENDA  ;;;
;;;;;;;;;;;;;;;;

(setq org-agenda-skip-scheduled-if-done t)
(setq org-agenda-skip-deadline-if-done t)
(setq org-agenda-ndays 7)
(setq org-deadline-warning-days 14)
(setq org-agenda-show-all-dates t)
(setq org-agenda-start-on-weekday nil)

(setq org-agenda-custom-commands
      (quote (("c" todo "DONE|CANCELLED" nil)
              ("w" todo "WAITING" nil)
              ("A" agenda "" ((org-agenda-ndays 21)))
              ("P" agenda ""
               ((org-agenda-skip-function
                 (lambda nil
                   (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
                (org-agenda-ndays 1)
                (org-agenda-overriding-header "Today's Priority #A tasks: ")))
              ("u" alltodo ""
               ((org-agenda-skip-function
                 (lambda nil
                   (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
                                             (quote regexp) "\n]+>")))
                (org-agenda-overriding-header "Unscheduled TODO entries: "))))))

;;;;;;;;;;;;
;;  TAGS  ;;
;;;;;;;;;;;;

(setq org-use-tag-inheritance t)

;;;;;;;;;;;;;;;;
;;  KEYWORDS  ;;
;;;;;;;;;;;;;;;;

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d)")
              (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)"))))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "light green" :weight bold)
              ("MEETING" :foreground "dark yellow" :weight bold)
              ("NEXT" :foreground "white" :weight bold)
              ("STARTED" :foreground "yellow" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("HOLD" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "gray" :weight bold))))

(setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING" . t) ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("STARTED" ("WAITING") ("CANCELLED") ("HOLD") ("NEXT"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "h"
       #'(lambda nil (interactive) (org-todo "HOLD")))
     (define-key org-todo-state-map "n"
       #'(lambda nil (interactive) (org-todo "NEXT")))
     ;; (define-key org-todo-state-map "f"
     ;; #'(lambda nil (interactive) (org-todo "DEFERRED")))
     ;; (define-key org-todo-state-map "l"
     ;; #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))))

;;;;;;;;;;;;;;;;;;;;;;;
;;;  CLOCK - TIMER  ;;;
;;;;;;;;;;;;;;;;;;;;;;;

(setq org-clock-in-resume t)
(setq org-clock-persist 'history)
(setq org-clock-report-include-clocking-task t)
(setq org-clock-persistence-insinuate 'history)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-clock-sound t)
(setq org-clock-history-length 23)
;; (setq org-clock-persist-query-resume nil)
;; (setq org-clock-in-switch-to-state "STARTED")

;; Auto clock-in on STARTED
(defun auto-todo-state-change ()
  (cond ((string-equal org-state "STARTED") (org-clock-in))
        ((and (not (string-equal org-state "STARTED"))
              (org-clock-is-active))
         (org-clock-out))))

(add-hook 'org-after-todo-state-change-hook 'auto-todo-state-change)

;; http://article.gmane.org/gmane.emacs.orgmode/3629


(defvar org-my-archive-expiry-days 7
  "The number of days after which a completed task should be auto-archived.
This can be 0 for immediate, or a floating point value.")

;; http://stackoverflow.com/a/27048241
(setq org-loop-over-headlines-in-active-region 'start-level)

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file))

;; AR- Not active yet
;; (setq safe-local-variable-values (quote ((after-save-hook archive-done-tasks))))

;; (defalias 'archive-done-tasks 'org-my-archive-done-tasks)
