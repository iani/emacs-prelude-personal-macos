;;; org-mode_todo_states_and_priorities --- 2019-06-29 08:08:23 AM
;; Experimental, 29 Sep 2018 04:25
;; after https://orgmode.org/manual/Fast-access-to-TODO-states.html#Fast-access-to-TODO-states

;; Example of more elaborate todo keywords
;; (setq org-todo-keywords
;;       '((sequence "TODO(t)" "|" "DONE(d)")
;;         (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)")
;;         (sequence "|" "CANCELED(c)")))

;; Example of custom colors for keywords
;; (setq org-todo-keyword-faces
;;       '(("TODO" . (:foreground "#ff39a3" :weight bold))
;;         ("STARTED" . "#E35DBF")
;;         ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
;;         ("DELEGATED" . "pink")
;;         ("POSTPONED" . "#008080")))
;;

(defun org-todo-list-all-keywords-separately ()
"Open separate org-todo-list buffers for each keyword.
For safety, call this function after agenda or todo-list
has already been constructed."
  (interactive)
  (mapc (lambda (x) (org-todo-list x)) '(1 2 3 4 5 6 7 8 9 10 11 12 13 14)))

(global-set-key (kbd "C-c C-S-a") 'org-todo-list-all-keywords-separately)

(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "URGENT(u)" "|" "REVIEW(r@)" "|" "ACTIVE(a)" "|" "DONE(d@)")
        (sequence "DAILY(D)" "|" "WEEKLY(W)" "|" "MONTHLY(M)" "|" "YEARLY(Y)" )
        (sequence "MILESTONE(S)" "|" "DEADLINE(L)" )
        (sequence "|" "DELEGATED(l)")
        (sequence "|" "CANCELED(c)")
        (sequence "|" "POSTPONED(p)")))

(setq org-todo-keyword-faces
      '(("TODO" . (:foreground "red1" :weight bold))
        ("REVIEW" . (:foreground "chocolate" :background "navy" :weight bold))
        ("URGENT" . (:foreground "red1" :background "orange1" :weight bold))
        ("ACTIVE" . (:foreground "salmon" :weight bold))
        ;; ("STARTED" . "#E35DBF")
        ("CANCELED" . (:foreground "white" :background "#4d4d4d" :weight bold))
        ("DELEGATED" . (:foreground "orange2" :background "#4d4d4d" :weight bold))
        ("POSTPONED" . (:foreground "dark cyan" :weight bold))
        ("DAILY" . (:foreground "LightCoral" :weight bold))
        ("WEEKLY" . (:foreground "OrangeRed" :weight bold))
        ("MONTHLY" . (:foreground "firebrick" :weight bold))
        ("YEARLY" . (:foreground "gainsboro" :background "DarkRed" :weight bold))
        ("MILESTONE" . (:foreground "MediumSpringGreen" :weight bold))
        ("DEADLINE" . (:foreground "gold"
                                   ;; :background "DarkRed"
                                   :weight bold))
        ;; ("POSTPONED" . "#008080")
        ))

(setq org-lowest-priority 77) ;; Set possible priorities range from A to M
(setq org-default-priority 77) ;; List TODOS without priority setting at the bottom
(provide 'org-mode_todo_states_and_priorities)
;;; 032_org-mode_todo_states_and_priorities.el ends here
