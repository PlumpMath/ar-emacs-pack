(live-add-pack-lib "dash.el")
(live-add-pack-lib "projectile")

(require 'dash)
(require 'projectile)

(setq projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name))))
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-find-file-dwim)
(setq projectile-enable-idle-timer t)
(setq projectile-idle-timer-seconds 60)

(projectile-global-mode)
