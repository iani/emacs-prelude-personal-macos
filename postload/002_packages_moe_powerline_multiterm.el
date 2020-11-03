;;; packages_moe_powerline_multiterm --- 2019-06-29 08:08:20 AM
  ;;; Commentary:
  ;;; this is only some of the packages.
  ;;; Some other required packages are loaded in the following postload files.
  ;;; using prelude-require-package ensures that the packges are loaded
  ;;; at the time required, if necessary.

  ;;; Code:

  ;; include all package repositories needed
  (setq package-archives
        '(("melpa" . "https://melpa.org/packages/")
          ("gnu" . "https://elpa.gnu.org/packages/")
          ("org" . "http://orgmode.org/elpa/")))
  (package-initialize)

  (require 'prelude-packages)

  (prelude-require-packages
   '(
     moe-theme
     powerline
     multi-term))

(provide 'packages_moe_powerline_multiterm)
;;; 002_packages_moe_powerline_multiterm.el ends here
