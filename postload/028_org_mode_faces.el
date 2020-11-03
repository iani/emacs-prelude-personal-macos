;;; org_mode_faces --- 2019-06-29 08:08:22 AM
(custom-set-faces
   ;; #ef2929
   ;; '(org-priority ((t (:background "#ff5959" :foreground "gray99"))) t)
   ;; '(org-block-end-line ((t (:background "#2a2a2f" :foreground "gray99"))) t)
   ;; '(org-block-begin-line ((t (:background "#3a2a2f" :foreground "gray99"))) t)
   ;; '(org-level-1 ((t (:family "Helvetica" :height 1.1 :weight bold))))
   ;; ;; thinner org-level-2 face for kanji
   ;; '(org-level-2
   ;;   ((t
   ;;     (:family "Inconsolata" :height 1.1 :weight light :box nil
   ;;              :foreground "#a1db00" :inherit
   ;;              (outline-2)))))<
   ;; '(org-level-1 ((t (:family "Courier New" :height 1.1 :weight bold))))
   ;; '(org-level-2 ((t (:family "Courier New" :height 1.1 :weight bold))))
 '(org-level-1 ;; ((t (:weight bold :height 1.7 :family "Source Code Pro")))
   ((t
     (:family "Linux Libertine" :height 1.5 :weight bold
              ;; :foreground "#DFAF8F"
              :inherit
              (default))))
                 )
 '(org-level-2 ;; ((t (:weight bold :height 1.5)))
   ((t
     (:family "Linux Libertine" :height 1.3 :weight bold
              :inherit
              (default))))
                 )
 '(org-level-3 ;; ((t (:weight bold :height 1.2)))
   ((t
     (:family "Linux Libertine" :height 1.2 :weight bold
              :inherit
              (default))))
                 )
 '(org-level-4 ;; ((t (:weight bold :height 1.1)))
   ((t
     (:family "Linux Libertine" :height 1.1 :weight bold
              :inherit
              (default))))
                 )
   '(org-level-5 ;; ((t (:weight bold :height 1.1)))
     ((t
       (:family "Linux Libertine" :height 1.1 :weight bold
                :inherit
                (default)))) )
   '(org-level-6 ;; ((t (:weight bold :height 1.1)))
     ((t
       (:family "Linux Libertine" :height 1.1 :weight bold
                :inherit
                (default)))) )
   '(org-level-7 ;; ((t (:weight bold :height 1.1)))
     ((t
       (:family "Linux Libertine" :height 1.1 :weight bold
                :inherit
                (default))))  )
   '(org-level-8 ;; ((t (:weight bold :height 1.1)))
     ((t
       (:family "Linux Libertine" :height 1.1 :weight bold
                :inherit
                (default)))) )
   '(org-level-9 ;; ((t (:weight bold :height 1.1)))
                 )) ;
(provide 'org_mode_faces)
;;; 028_org_mode_faces.el ends here
