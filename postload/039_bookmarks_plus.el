;; load bookmarks plus
;; Has to be loaded from emacswiki. No longer available on MELPA
;; see https://www.emacswiki.org/emacs/BookmarkPlus#toc3
;; Loading bookmark plus once interferes with plain bookmarks and breaks them.
;; Thereafter, bookmark plus has to be loaded for bookmarks to work.

;; Code:
(let ((bookmarkplus-dir "~/.emacs.d/custom/bookmark-plus/")
      (emacswiki-base "https://www.emacswiki.org/emacs/download/")
      (bookmark-files '("bookmark+.el" "bookmark+-mac.el" "bookmark+-bmu.el" "bookmark+-key.el" "bookmark+-lit.el" "bookmark+-1.el")))
  (require 'url)
  (add-to-list 'load-path bookmarkplus-dir)
  (make-directory bookmarkplus-dir t)
  (mapcar (lambda (arg)
            (let ((local-file (concat bookmarkplus-dir arg)))
              (unless (file-exists-p local-file)
                (url-copy-file (concat emacswiki-base arg) local-file t))))
          bookmark-files)
  (byte-recompile-directory bookmarkplus-dir 0)
  (require 'bookmark+))
