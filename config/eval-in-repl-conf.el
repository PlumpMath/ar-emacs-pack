(live-add-pack-lib "eval-in-repl")

;; require the main file containing common functions
(require 'eval-in-repl)

;; ielm support (for emacs lisp)
(require 'eval-in-repl-ielm)

(setq eir-jump-after-eval nil)

;; for .el files
(define-key emacs-lisp-mode-map (kbd "C-M-x") 'eir-eval-in-ielm)
;; for *scratch*
(define-key lisp-interaction-mode-map (kbd "C-M-x") 'eir-eval-in-ielm)
;; for M-x info
;;(define-key Info-mode-map (kbd "C-M-x") 'eir-eval-in-ielm)

;; cider support (for Clojure)
;; (require 'cider) ; if not done elsewhere
;; (require 'eval-in-repl-cider)
;; (define-key clojure-mode-map (kbd "<C-return>") 'eir-eval-in-cider)


;; SLIME support (for Common Lisp)
;; (require 'slime) ; if not done elsewhere
;; (require 'eval-in-repl-slime)
;; (add-hook 'lisp-mode-hook
;; '(lambda ()
;; (local-set-key (kbd "<C-return>") 'eir-eval-in-slime)))

;; Geiser support (for Racket and Guile Scheme)
;; When using this, turn off racket-mode and scheme supports
;; (require 'geiser) ; if not done elsewhere
;; (require 'eval-in-repl-geiser)
;; (add-hook 'geiser-mode-hook
          ;; '(lambda ()
             ;; (local-set-key (kbd "<C-return>") 'eir-eval-in-geiser)))

;; racket-mode support (for Racket; if not using Geiser)
;; (require 'racket-mode) ; if not done elsewhere
;; (require 'eval-in-repl-racket)
;; (define-key racket-mode-map (kbd "<C-return>") 'eir-eval-in-racket)

;; Scheme support (if not using Geiser))
;; (require 'scheme)    ; if not done elsewhere
;; (require 'cmuscheme) ; if not done elsewhere
;; (require 'eval-in-repl-scheme)
;; (add-hook 'scheme-mode-hook
;;    '(lambda ()
;;       (local-set-key (kbd "<C-return>") 'eir-eval-in-scheme)))

;; Hy support
;; (require 'hy-mode) ; if not done elsewhere
;; (require 'eval-in-repl-hy)
;; (define-key hy-mode-map (kbd "<C-return>") 'eir-eval-in-hy)


;; Python support
;; (require 'python) ; if not done elsewhere
;; (require 'eval-in-repl-python)
;; (define-key python-mode-map (kbd "<C-return>") 'eir-eval-in-python)

;; Ruby support
;; (require 'ruby-mode) ; if not done elsewhere
;; (require 'inf-ruby)  ; if not done elsewhere
;; (require 'ess)       ; if not done elsewhere
;; (require 'eval-in-repl-ruby)
;; (define-key ruby-mode-map (kbd "<C-return>") 'eir-eval-in-ruby)

;; SML support
;; (require 'sml-mode) ; if not done elsewhere
;; (require 'eval-in-repl-sml)
;; (define-key sml-mode-map (kbd "<C-return>") 'eir-eval-in-sml)
;; (define-key sml-mode-map (kbd "C-;") 'eir-send-to-sml-semicolon)

;; OCaml support
;; (require 'tuareg) ; if not done elsewhere
;; (require 'eval-in-repl-ocaml)
;; (define-key tuareg-mode-map (kbd "<C-return>") 'eir-eval-in-ocaml)
;; function to send a semicolon to OCaml REPL
;; (define-key tuareg-mode-map (kbd "C-;") 'eir-send-to-ocaml-semicolon)

;; Shell support
(require 'eval-in-repl-shell)
(add-hook 'sh-mode-hook
          '(lambda()
             (local-set-key (kbd "C-M-x") 'eir-eval-in-shell)))

;; Version with opposite behavior to eir-jump-after-eval configuration
;; (defun eir-eval-in-shell2 ()
;;   "eval-in-repl for shell script (opposite behavior)

;; This version has the opposite behavior to the eir-jump-after-eval
;; configuration when invoked to evaluate a line."
;;   (interactive)
;;   (let ((eir-jump-after-eval (not eir-jump-after-eval)))
;;     (eir-eval-in-shell)))

;; (add-hook 'sh-mode-hook
;;           '(lambda()
;;              (local-set-key (kbd "C-M-<return>") 'eir-eval-in-shell2)))
