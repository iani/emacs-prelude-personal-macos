(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/savefile/bookmarks")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-safe-themes
   '("27a1dd6378f3782a593cc83e108a35c2b93e5ecc3bd9057313e1d88462701fcd" default))
 '(fci-rule-color "#383838")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(highlight-parentheses zop-to-char zenburn-theme yaml-mode workgroups2 which-key web-mode volatile-highlights vkill use-package undo-tree tiny-menu tidal sr-speedbar smex smartrep smartparens smart-mode-line slime scss-mode sclang-extensions rainbow-mode rainbow-delimiters perspective ox-hugo ov osx-plist org-ref org-plus-contrib org-journal org-bullets operate-on-number multi-term move-text moe-theme mediawiki mc-extras markdown-mode magit litable json-mode js2-mode imenu-anywhere image-dired+ ido-completing-read+ icicles hl-sexp helm-swoop helm-projectile helm-descbinds helm-ag guru-mode grizzl gotest god-mode go-projectile gitignore-mode gitconfig-mode git-timemachine gist geiser flycheck-lilypond flx-ido expand-region exec-path-from-shell espresso-theme elisp-slime-nav eink-theme editorconfig ebib easy-kill easy-hugo dracula-theme doneburn-theme dockerfile-mode django-theme discover-my-major diminish diff-hl deft darktooth-theme darkroom darkokai-theme darkmine-theme darkburn-theme cycle-themes csv-mode crux creamsody-theme corral company-go company-auctex company-anaconda commentary-theme circadian chyla-theme cdlatex caroline-theme calfw-org calfw-cal calfw buffer-move browse-kill-ring bookmark+ bm bliss-theme blackboard-theme beacon basic-theme badwolf-theme badger-theme avy-zap autobookmarks auto-async-byte-compile anzu ample-zen-theme ample-theme alect-themes airline-themes ahungry-theme afternoon-theme ace-window ace-popup-menu ace-mc ace-isearch ac-c-headers abyss-theme))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:weight bold :foreground "white" :background "red" :inherit (aw-mode-line-face)))))
 '(font-lock-comment-delimiter-face ((((class color) (min-colors 89)) (:background nil :foreground "#6c6c6c" :slant italic))))
 '(font-lock-comment-face ((((class color) (min-colors 89)) (:background nil :foreground "#6c6c6c" :slant italic))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:background nil :foreground "#ff8700"))))
 '(info-title-3 ((((class color) (min-colors 89)) (:foreground "#ff8700" :bold t))))
 '(info-title-4 ((((class color) (min-colors 89)) (:foreground "#ff4ea3" :bold t))))
 '(mode-line ((((class color) (min-colors 89)) (:box nil :background "#afd7ff" :foreground "#005f87"))))
 '(org-level-1 ((((class color) (min-colors 89)) (:foreground "#5fafd7"))))
 '(org-level-2 ((((class color) (min-colors 89)) (:foreground "#a1db00"))))
 '(org-level-3 ((((class color) (min-colors 89)) (:foreground "#ff8700"))))
 '(org-level-4 ((((class color) (min-colors 89)) (:foreground "#00d7af"))))
 '(org-level-5 ((((class color) (min-colors 89)) (:foreground "#ef2929"))))
 '(org-level-6 ((((class color) (min-colors 89)) (:foreground "#af5fff"))))
 '(org-level-7 ((((class color) (min-colors 89)) (:foreground "#ff4ea3"))))
 '(org-level-8 ((((class color) (min-colors 89)) (:foreground "#ffd700"))))
 '(rainbow-delimiters-depth-1-face ((((class color) (min-colors 89)) (:bold t :foreground "#dd0000"))))
 '(rainbow-delimiters-depth-2-face ((((class color) (min-colors 89)) (:bold t :foreground "#5fafd7"))))
 '(rainbow-delimiters-depth-3-face ((((class color) (min-colors 89)) (:bold t :foreground "#a1db00"))))
 '(rainbow-delimiters-depth-4-face ((((class color) (min-colors 89)) (:bold t :foreground "#ff4ea3"))))
 '(rainbow-delimiters-depth-5-face ((((class color) (min-colors 89)) (:bold t :foreground "#00d7af"))))
 '(rainbow-delimiters-depth-6-face ((((class color) (min-colors 89)) (:bold t :foreground "#ff8700"))))
 '(rainbow-delimiters-depth-7-face ((((class color) (min-colors 89)) (:bold t :foreground "#af5fff"))))
 '(rainbow-delimiters-depth-8-face ((((class color) (min-colors 89)) (:bold t :foreground "#c6c6c6"))))
 '(rainbow-delimiters-depth-9-face ((((class color) (min-colors 89)) (:bold t :foreground "#ffd700")))))
