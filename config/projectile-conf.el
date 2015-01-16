(live-add-pack-lib "f.el")
(live-add-pack-lib "s.el")
(live-add-pack-lib "dash.el")
(live-add-pack-lib "projectile")

(require 'f)
(require 's)
(require 'dash)
(require 'projectile)

(setq projectile-mode-line '(:eval (format " Proj[%s]" (projectile-project-name))))
(setq projectile-enable-caching t)

(projectile-global-mode)
