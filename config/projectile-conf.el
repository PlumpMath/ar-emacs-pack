(live-add-pack-lib "projectile")

(require 'projectile)
(require 'helm-projectile)

(setq projectile-mode-line '(:eval (format " Prj[%s]" (projectile-project-name))))
(setq projectile-enable-caching t)
(setq projectile-switch-project-action 'projectile-find-file-dwim)
(setq projectile-enable-idle-timer t)
(setq projectile-idle-timer-seconds 60)
(setq projectile-create-missing-test-files t)

(projectile-global-mode)
