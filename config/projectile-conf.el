(live-add-pack-lib "f.el")
(live-add-pack-lib "s.el")
(live-add-pack-lib "dash.el")
(live-add-pack-lib "projectile")

(require 'f)
(require 's)
(require 'dash)
(require 'projectile)

(setq projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name))))
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-find-file-dwim)
(setq projectile-enable-idle-timer t)
(setq projectile-idle-timer-seconds 60)

(projectile-global-mode)

;; bindings
(define-key projectile-mode-map (kbd "s-d") 'projectile-find-dir)
(define-key projectile-mode-map (kbd "s-p") 'projectile-persp-switch-project)
;; (define-key projectile-mode-map (kbd "s-p") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "s-f") 'projectile-find-file)
(define-key projectile-mode-map (kbd "s-g") 'projectile-grep)
(define-key projectile-mode-map (kbd "s-b") 'projectile-switch-to-buffer)
(define-key projectile-mode-map (kbd "s-.") 'projectile-find-tag)
