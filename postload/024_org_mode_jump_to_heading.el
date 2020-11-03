;;; org_mode_jump_to_heading --- 2019-06-29 08:08:22 AM
  ;;; Commentary:

  ;; these settins are needed to use C-c C-j org-goto
  ;; or C-c C-i imenu-anywhere properly on the current buffer
  ;; C-c C-j is more predictable than C-c C-i,
  ;;; Code:

  (setq org-goto-interface 'outline-path-completion
        org-goto-max-level 10)

  ;; use C-u C-c C-w org-refile:

  (setq org-outline-path-complete-in-steps nil)
(provide 'org_mode_jump_to_heading)
;;; 024_org_mode_jump_to_heading.el ends here
