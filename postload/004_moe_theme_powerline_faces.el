;;; moe_theme_powerline_faces --- 2019-06-29 08:08:20 AM
  ;;; Commentary:
  ;;; moe-theme

;;; Code:
;;; (prelude-require-package 'moe-theme)
(require 'moe-theme)
(setq powerline-moe-theme t)
(moe-dark)

;;; (prelude-require-package 'powerline)
(require 'powerline)
(powerline-default-theme)
(custom-set-faces
 '(info-title-3 ((t (:inherit info-title-4 :foreground "white" :height 1.2))))
 '(info-title-4 ((t (:inherit info-title-4 :foreground "red"))))
 '(font-lock-variable-name-face ((t
                                  (:foreground "turquoise2"))))
 '(font-lock-comment-delimiter-face ((t
                                      (:slant italic :foreground "SeaGreen1"))))
 '(font-lock-comment-face ((t
                            (:slant italic :foreground "coral1"))))
 '(mode-line ((t (
                  :background "midnight blue"
                  :foreground "tomato"
                  :box (:line-width 1 :color "turquoise3")
                  :weight light :height 120 :family "Ubuntu"))))
 '(aw-leading-char-face ((t
                          (:weight bold :foreground "white" :background "red" :inherit
                                   (aw-mode-line-face))))))
(provide 'moe_theme_powerline_faces)
;;; 004_moe_theme_powerline_faces.el ends here
