(setq org-default-notes-file
      (concat (file-truename "~/Documents/000Workfiles/PROJECTS_CURRENT/")
              "PROJECT_REVIEW_AND_CAPTURE.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
         "* TODO %?\n  %i\n  %a")
        ("j" "Journal" entry (file+datetree org-default-notes-file)
         "* %?\nEntered on %U\n  %i\n  %a")))

(defcustom org-refile-targets
  '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
     :maxlevel . 1))
  "File used for project notes.
Used by org-refile for jumping to project topics." )

(defun org-refile-set-target-level-1 ()
  "Set maxlevel 1"
  (interactive)
  (setq org-refile-targets
        '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
           :maxlevel . 1))))

(defun org-refile-set-target-level-2 ()
  "Set maxlevel 2"
  (interactive)
  (setq org-refile-targets
        '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
           :maxlevel . 2))))

(defun org-refile-set-target-level-3 ()
  "Set maxlevel 3"
  (interactive)
  (setq org-refile-targets
        '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
           :maxlevel . 3))))

(defun org-set-agenda-files-global ()
  "Set org-agenda-files to global file paths."
  (interactive)
  (setq org-agenda-files `(,org-journal-dir
                           ,org-projects-dir
                           ,org-avarts-dir)))

(defun org-set-agenda-files-project ()
  "Set org-agenda-files to project summaries."
  (interactive)
  (setq org-agenda-files '("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org")))

(global-set-key (kbd "C-S-c C-S-c") 'org-capture)
(global-set-key (kbd "C-S-c C-S-r") 'org-capture-goto-last-stored)

(defun org-refile-jump-to-target ()
  "Call org-refile with argument to jump to target."
  (interactive)
  (let ((org-refile-targets
         '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
            :maxlevel . 2))))
    (funcall-interactively 'org-refile '(4))))

(defun org-refile-clear-cache ()
  "Clear org refile cache."
  (interactive)
  (org-refile-cache-clear)
  ;; (funcall-interactively 'org-refile '(64)
  )

(defun org-open-project-summary-file ()
  "Open project file."
  (interactive)
  (let ((org-refile-targets
         '(("~/Documents/000Workfiles/PROJECTS_CURRENT/PROJECT_SUMMARIES.org"
            :maxlevel . 2))))
    (find-file (caar org-refile-targets))))

(defhydra hydra-org-refile (
                          ;; sclang-mode-map "C-L"
                            :color blue :columns 3)
  "Org refile hydra"
  ("c" org-refile-clear-cache "clear cache")
  ("r" org-refile-keep "refile (keep)")
  ("R" org-refile "refile (do not keep)")
  ("j" org-refile-jump-to-target "jump to refile target")
  ("l" org-refile-goto-last-stored "goto last stored")
  ("p" org-set-agenda-files-project "agenda use project file")
  ("g" org-set-agenda-files-global "agenda use global files")
  ("o" org-open-project-summary-file "open project file")
  ("1" org-refile-set-target-level-1 "show only level 1")
  ("2" org-refile-set-target-level-2 "show down to level 2")
  ("3" org-refile-set-target-level-3 "show down to level 3")
  ;; ("q" quit "quit" :exit t)
  )

(global-set-key (kbd "C-M-S-r") 'hydra-org-refile/body)
