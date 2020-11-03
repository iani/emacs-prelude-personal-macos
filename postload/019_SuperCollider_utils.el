;;; SuperCollider_utils --- 2019-06-29 08:08:22 AM
(prelude-require-packages
 '(
   smartparens
   rainbow-delimiters
   ;; auto-complete
   ))

;; (require 'smartparens-config)
(add-hook 'sclang-mode-hook 'smartparens-mode)
(add-hook 'sclang-mode-hook 'rainbow-delimiters-mode)
(add-hook 'sclang-mode-hook 'highlight-parentheses-mode)
;; (add-hook 'sclang-mode-hook 'hl-sexp-mode)
;; (add-hook 'sclang-mode-hook 'hs-minor-mode)
(add-hook 'sclang-mode-hook 'electric-pair-mode)
;; (add-hook 'sclang-mode-hook 'yas-minor-mode)
;; (add-hook 'sclang-mode-hook 'auto-complete-mode)

(add-hook 'sclang-mode-hook
          (lambda()
            ;; (local-set-key (kbd "H-b b") 'hs-toggle-hiding)
            ;; (local-set-key (kbd "H-b H-b")  'hs-hide-block)
            ;; (local-set-key (kbd "H-b a")    'hs-hide-all)
            ;; (local-set-key (kbd "H-b H-a")  'hs-show-all)
            ;; (local-set-key (kbd "H-b l")  'hs-hide-level)
            ;; (local-set-key (kbd "H-b H-l")  'hs-show-level)
            ;; (hs-minor-mode 1)
            (visual-line-mode 1)))

(defun sclang-2-windows ()
  "Reconfigure frame to this window and sclang-post-window."
  (interactive)
  (delete-other-windows)
  (sclang-show-post-buffer))

(defun scundelify ()
  "Convert //: snippet blocks to regular style () sc blocks in document."
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "\n//:" nil t)
      (replace-match "\n\)\n//:")
      (goto-char (line-end-position 2))
      (goto-char (line-beginning-position 1))
      (insert "\(\n")
      (goto-char (line-beginning-position 1))
      (delete-blank-lines))
    (goto-char (point-min))
    (re-search-forward "\)\n//:" nil t)
    (replace-match "\n://:")))

(defun sclang-server-plot-tree ()
  "Open plotTree for default server."
  (interactive)
  (sclang-eval-string "Server.default.plotTree"))'

(defun sclang-server-meter ()
  "Open i/o meter for default server."
  (interactive)
  (sclang-eval-string "Server.default.meter"))

(defun sclang-server-scope ()
  "Open scope for default server."
  (interactive)
  (sclang-eval-string "Server.default.scope"))

(defun sclang-server-freqscope ()
  "Open frequency scope for default server."
  (interactive)
  (sclang-eval-string "Server.default.freqscope"))

(defun sclang-extensions-gui ()
  "Open gui for browsing user extensions classes and methods.
    Type return on a selected item to open the file where it is defined."
  (interactive)
  (sclang-eval-string "Class.extensionsGui;"))
(provide 'SuperCollider_utils)
;;; 019_SuperCollider_utils.el ends here
