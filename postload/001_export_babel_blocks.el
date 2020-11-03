;;; export_babel_blocks --- 2019-06-29 08:08:20 AM
  ;;; Commentary:
  ;;; org-el-untangle:
  ;;; import muliple el files from one folder into one org mode file.
  ;;; org-el-tangle-sections
  ;;; export each sections' emacs-lisp block to a separate file.

  ;;; Code:

  (defun org-el-export-all-sections ()
    "Export each sections' emacs-lisp block to a separate file.
  Add header and footer parts required by flycheck."
    (interactive)
    (let
        ((index 0)
         (root-dir (file-name-directory (buffer-file-name)))
         buffers)
      ;;; First delete old entries, before creating new ones.
      ;;; Prevent duplicate entries due to renumbering.
      (mapc 'delete-file (file-expand-wildcards (concat root-dir "*.el")))
      (org-map-entries 'org-el-export-1-section)
      (message "Export of %d emacs-lisp blocks finished!" index)
      ))

  (defun org-el-export-1-section ()
    "Export this sections' emacs-lisp block to a separate file.
  Add header and footer parts required by flycheck.
  Skip sections marked with COMMENT."
    (let* (body-element
           (element (cadr (org-element-at-point)))
           (title (plist-get element :title))
           (commented (plist-get element :commentedp))
           (filename))
      ;; skip commented sections
      (unless commented
        (setq index (+ 1 index))
        (search-forward "#+BEGIN_SRC")
        (setq body-element (cadr (org-element-at-point)))
        (setq title (replace-regexp-in-string " " "_" title))
        (setq filename (format "%03d_%s.el" index title))
        (with-temp-buffer
          (insert (format ";;; %s --- %s"
                          title
                          (format-time-string "%F %r\n")))
          (goto-char (point-max))
          (insert (plist-get body-element :value))
          (goto-char (point-max))
          (insert (format "(provide '%s)\n;;; %s ends here" title filename))
          (write-file filename)))))

  (eval-after-load 'org
    '(progn
       ;; Note: This keybinding is in analogy to the default keybinding:
       ;; C-c . -> org-time-stamp
       (define-key org-mode-map (kbd "C-c C-M-e") 'org-el-export-all-sections)))
(provide 'export_babel_blocks)
;;; 001_export_babel_blocks.el ends here
