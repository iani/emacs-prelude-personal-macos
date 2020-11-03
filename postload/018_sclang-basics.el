;;; sclang-basics --- 2019-06-29 08:08:22 AM

;;; Commentary:

;;; Code:
(require 'sclang)

;;; macos-specific
;;; Directory of SuperCollider support, for quarks, plugins, help etc.
(defvar sc_userAppSupportDir
  (expand-file-name "~/Library/Application Support/SuperCollider"))

;; Make path of sclang executable available to emacs shell load path

;; For Version 3.6.6:
(add-to-list
 'exec-path
 "/Applications/SuperCollider/SuperCollider.app/Contents/Resources/")

;; For Version 3.7:
(add-to-list
 'exec-path
 "/Applications/SuperCollider/SuperCollider.app/Contents/MacOS/")

;; Global keyboard shortcut for starting sclang
(global-set-key (kbd "C-c M-s") 'sclang-start)
;; Start sclang and open workspace window
(global-set-key (kbd "C-c C-M-s") 'sclang-start-with-workspace)

(defun sclang-start-with-workspace ()
  "Start sclang and open workspace window."
  (interactive)
  (sclang-start)
  (sclang-switch-to-workspace))

;; overrides alt-meta switch command
(global-set-key (kbd "C-c W") 'sclang-switch-to-workspace)
(provide 'sclang-basics)
;;; 018_sclang.el ends here
