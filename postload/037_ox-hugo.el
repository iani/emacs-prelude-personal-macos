;;; ox-hugo --- 2019-06-29 08:08:23 AM
  ;;; Commentary:

  ;; Functions for ox-hugo.  (11 Aug 2018 11:36)

  ;; This package makes it easier to use ox-hugo

  ;; After installing ox-hugo as explained in the next section,
  ;; org-export-dispatch (C-c C-e) will show you the option
  ;; for exporting with hugo (H key).
  ;; Documentation about how to use ox-hugo is found here:
  ;; https://ox-hugo.scripter.co/

  ;; This code requires ox-hugo package.
  ;; Installing: 15 Jun 2019 08:03, what worked:
  ;; list-packages, then find ox-mdx-deck, and install it from the list.
  ;; Had to try 2 times.

  ;;; Code:

  ;; Availability of these 2 packages on melpa is not guaranteed
  ;; on first try.  You may have to try several times
  ;; after running list-packages, and installing ox-mdx-deck from
  ;; the buffer of list-packages:
;;  (prelude-require-package 'ox-mdx-deck) ;; this may help to get ox-hugo
  (prelude-require-package 'ox-hugo)     ;; ox-hugo is used here (not ox-mdx-deck)

  ;; explicitly require ox-hugo to add it to the dispatcher menu:
  (require 'ox-hugo)

  ;; default export directory
  (defcustom org-hugo-export-dir "~/hugo-exports"
    "Directory for exporting hugo with ox-hugo.")

  (defvar org-hugo-path-of-last-export nil
    "Path of file exported by latest ox-hugo command.")

  ;; overwrite original ox-hugo function to store
  ;; location of last written file
  (defun org-hugo--after-export-function (info outfile)
    "Function to be run after an ox-hugo export.

  Customized version: Store location of last written hugo file.

  This function is called in the very end of
  `org-hugo-export-to-md', `org-hugo-export-as-md' and
  `org-hugo-publish-to-md'.

  INFO is a plist used as a communication channel.

  OUTFILE is the Org exported file name.

  This is an internal function."
    (advice-remove 'org-babel-exp-code #'org-hugo--org-babel-exp-code)
    (when outfile
      (setq org-hugo-path-of-last-export outfile))
    (when (and outfile
               (org-hugo--pandoc-citations-enabled-p info))
      (require 'ox-hugo-pandoc-cite)
      (plist-put info :outfile outfile)
      (plist-put info :front-matter org-hugo--fm)
      (org-hugo-pandoc-cite--parse-citations-maybe info))
    (setq org-hugo--fm nil)
    (setq org-hugo--fm-yaml nil))

  (defun org-hugo-open-last-exported-file ()
    "Open file last exported by ox-hugo."
    (interactive)
    (if org-hugo-path-of-last-export
        (find-file org-hugo-path-of-last-export)
      (message "There has been no ox-hugo export in this emacs session")))

  ;;; use yaml format in export front matter,
  ;;; because most themes use this as default
  (setq org-hugo-front-matter-format "yaml")

  (defhydra hydra-hugo (:color red :columns 3)
    "hugo hydra"

    ("x" org-export-hugo "export hugo")
    ("t" org-hugo-set-title "set title")
    ("f" org-hugo-set-section-filename "set hugo section filename")
    ("d" org-hugo-set-post-directory "set hugo section post directory")
    ("o" org-hugo-open-last-exported-file "open last exported file")
    ("q" quit "exit hydra" :exit t))

  (defun org-hugo-set-title (&optional title)
    "Set value of TITLE property globally in current buffer."
    (interactive "sTitle:")
    (save-excursion
      (org-with-wide-buffer
       (goto-char (point-min))
       (let ((new-line "")
             (here (re-search-forward
                    (concat "^"
                            (regexp-quote (concat "#+" "TITLE" ":"))
                            " ?") nil t)))
         (cond
          (here
           (goto-char here)
           (beginning-of-line)
           (kill-line))
          (t
           (setq new-line "\n")
           (goto-char (point-min))))
         (insert "#+TITLE: " title new-line)))))

  (defun org-hugo-set-section-filename (filename)
    "Set property EXPORT_FILE_NAME in current section."
    (interactive "sFilename: ")
    (org-set-property "EXPORT_FILE_NAME" filename))

  (defun org-hugo-set-post-directory (directory)
    "Set property EXPORT_HUGO_SECTION in current section."
    (interactive "sSection: ")
    (org-set-property "EXPORT_HUGO_SECTION" directory))

  ;;; prepare hugo export
  (defun org-export-hugo ()
    "Prepare hugo export.
  Set ox-hugo export base directory property HUGO_BASE_DIR if needed.
  Set weights.
  Call org-export-dispatch."
    (interactive)
    (org-hugo-set-export-path-if-needed)
    (org-hugo-set-weights)
    (org-export-dispatch))

  (defun org-hugo-set-export-path-if-needed ()
    "If absent, set value of HUGO_BASE_DIR property in current buffer."
    (interactive)
    (let ((hugo-base-dir-property "HUGO_BASE_DIR"))
      (save-excursion
        (org-with-wide-buffer
         (goto-char (point-min))
         (let ((new-line "")
               (here (re-search-forward
                      (concat "^"
                              (regexp-quote (concat "#+" hugo-base-dir-property ":"))
                              " ?") nil t)))
           (unless here
             (setq new-line "\n")
             (goto-char (point-min))
             (insert "#+" hugo-base-dir-property ": " "~/hugo-exports\n")
             (message "I set %s" hugo-base-dir-property)))))))

  ;;; INCOMPLETE
  (defun org-hugo-set-export-path ()
    "Set value of HUGO_BASE_DIR property in current buffer."
    (interactive)
    (let ((hugo-base-dir-property "HUGO_BASE_DIR"))
      (save-excursion
        (org-with-wide-buffer
         (goto-char (point-min))
         (let ((new-line "")
               (here (re-search-forward
                      (concat "^"
                              (regexp-quote (concat "#+" hugo-base-dir-property ":"))
                              " ?") nil t)))
           (unless here
             (setq new-line "\n")
             (goto-char (point-min))
             (insert "#+" hugo-base-dir-property ": " "~/hugo-exports\n")
             (message "I set %s" hugo-base-dir-property)))))))

  (defun org-hugo-set-weights ()
    "Set correct hugo weights.
  Note: the auto-weight option of ox-hugo sets wrong weights, which result
  in subsubsections to be always at the bottom of a subsection, and not
  inside the subsection to which they belong.  Therefore renumbering is
  necessary if editing a site that has nested subsections inside subsections"
    (interactive)
    (let ((weight 0))
      (org-map-entries 'ox-hugo--set-weight))
    ;; The ox-hugo options disappear the second time after calling this:
    ;; (org-export-dispatch)
    (message "Weights for hugo export have been set."))

  (defun ox-hugo--set-weight ()
    "Set EXPORT_HUGO_WEIGHT property for this entry.
  Note: the auto-weight option of ox-hugo sets wrong weights, which result
  in subsubsections to be always at the bottom of a subsection, and not
  inside the subsection to which they belong. Therefore, the present renumbering is
  necessary if editing a site that has nested subsections inside subsections."
     (org-set-property "EXPORT_HUGO_WEIGHT" (format "%d" weight))
     (setq weight (+ 1 weight)))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  (defun ox-hugo-clear-contents ()
    "Delete contents of HUGO_BASE_DIR.
  TODO: make this delete only md files.
  Other files should remain, because they may be images (static content).
  Alternatively, put images in static only - not in content.
  See https://discourse.gohugo.io/t/solved-how-to-insert-image-in-my-post/1473/10
  "
    (interactive)
    (let* ((org-use-property-inheritance (org-hugo--selective-property-inheritance))
           (info (org-combine-plists
                  (org-export--get-export-attributes
                   'hugo nil nil
                   ;; subtreep visible-only
                   )
                  (org-export--get-buffer-attributes)
                  (org-export-get-environment 'hugo nil)))
           (pub-dir (org-hugo--get-pub-dir  info)))
      ;; (when (y-or-n-p (format "Delete contents of %s?" pub-dir))
      ;;   (delete-directory pub-dir t)
      ;;   (message "%s deleted!" pub-dir))
      (message "this is the pub dir %s\n" pub-dir)
      ))

  (defun ox-hugo-copy-root-dir ()
    "Copy hugo root directory to kill ring as shell-escaped string.
  Use: Paste the copied string in a shell terminal to go to the root dir,
  and then run hugo-server or hugo or other related commands."
    (interactive)
    (let* ((org-use-property-inheritance (org-hugo--selective-property-inheritance))
           (info (org-combine-plists
                  (org-export--get-export-attributes
                   'hugo nil nil
                   ;; subtreep visible-only
                   )
                  (org-export--get-buffer-attributes)
                  (org-export-get-environment 'hugo nil)))
           (pub-dir (org-hugo--get-pub-dir info)))
      (kill-new
       (shell-quote-argument (file-name-directory (directory-file-name pub-dir))))
      (message "Copied %s"
               (shell-quote-argument (file-name-directory (directory-file-name pub-dir))))))

  ;;; further tests. Prepare hugo export + copy of published data to nginx path
  (defun get-info-for-hugo ()
    "Experimental: Test how hugo gets info properties."
    (interactive)
    (message "The info is: %s" (org-combine-plists
                                (org-export--get-export-attributes
                                 'hugo ;; subtreep visible-only
                                 nil nil
                                 )
                                (org-export--get-buffer-attributes)
                                (org-export-get-environment 'hugo nil ;; subtreep
                                                            )))
    (org-export-get-environment 'hugo nil)
    (org-export--get-buffer-attributes))
(provide 'ox-hugo)
;;; 037_ox-hugo.el ends here
