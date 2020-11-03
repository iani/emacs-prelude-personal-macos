;;; hugo-render-and-copy_code --- 2019-06-29 08:08:23 AM
  (org-export-define-derived-backend 'hugo 'blackfriday ;hugo < blackfriday < md < html
    :menu-entry
    '(?H "Export to Hugo-compatible Markdown"
         ((?H "Subtree to file"
              (lambda (a _s v _b)
                (org-hugo-export-wim-to-md nil a v)))
          (?h "To file"
              (lambda (a s v _b)
                (org-hugo-export-to-md a s v)))
          (?O "Subtree to file and open"
              (lambda (a _s v _b)
                (if a
                    (org-hugo-export-wim-to-md nil :async v)
                  (org-open-file (org-hugo-export-wim-to-md nil a v)))))
          (?o "To file and open"
              (lambda (a s v _b)
                (if a (org-hugo-export-to-md t s v)
                  (org-open-file (org-hugo-export-to-md nil s v)))))
          (?A "All subtrees to files"
              (lambda (a _s v _b)
                (org-hugo-export-wim-to-md :all-subtrees a v)))
          (?t "To temporary buffer"
              (lambda (a s v _b)
                (org-hugo-export-as-md a s v)))))
  ;;;; translate-alist
    :translate-alist '((code . org-hugo-kbd-tags-maybe)
                       (example-block . org-hugo-example-block)
                       (export-block . org-hugo-export-block)
                       (export-snippet . org-hugo-export-snippet)
                       (headline . org-hugo-headline)
                       (inner-template . org-hugo-inner-template)
                       (keyword . org-hugo-keyword)
                       (link . org-hugo-link)
                       (paragraph . org-hugo-paragraph)
                       (src-block . org-hugo-src-block)
                       (special-block . org-hugo-special-block))
    :filters-alist '((:filter-body . org-hugo-body-filter))
  ;;;; options-alist
    ;;                KEY                       KEYWORD                    OPTION  DEFAULT                     BEHAVIOR
    :options-alist '(;; Variables not setting the front-matter directly
                     (:with-toc nil "toc" org-hugo-export-with-toc)
                     (:section-numbers nil "num" org-hugo-export-with-section-numbers)
                     (:author "AUTHOR" nil user-full-name newline)
                     (:creator "CREATOR" nil org-hugo-export-creator-string)
                     (:with-smart-quotes nil "'" nil) ;Don't use smart quotes; that is done automatically by Blackfriday
                     (:with-special-strings nil "-" nil) ;Don't use special strings for ndash, mdash; that is done automatically by Blackfriday
                     (:with-sub-superscript nil "^" '{}) ;Require curly braces to be wrapped around text to sub/super-scripted
                     (:hugo-with-locale "HUGO_WITH_LOCALE" nil nil)
                     (:hugo-front-matter-format "HUGO_FRONT_MATTER_FORMAT" nil     org-hugo-front-matter-format)
                     (:hugo-level-offset "HUGO_LEVEL_OFFSET" nil "1")
                     (:hugo-preserve-filling "HUGO_PRESERVE_FILLING" nil org-hugo-preserve-filling) ;Preserve breaks so that text filling in Markdown matches that of Org
                     (:hugo-delete-trailing-ws "HUGO_DELETE_TRAILING_WS" nil org-hugo-delete-trailing-ws)
                     (:hugo-section "HUGO_SECTION" nil org-hugo-section)
                     (:hugo-bundle "HUGO_BUNDLE" nil nil)
                     (:hugo-base-dir "HUGO_BASE_DIR" nil nil)
                     (:site-target-subdir "SITE_TARGET_SUBDIR" nil nil) ;Copy rendered files here
                     (:hugo-code-fence "HUGO_CODE_FENCE" nil t) ;Prefer to generate triple-backquoted Markdown code blocks by default.
                     (:hugo-use-code-for-kbd "HUGO_USE_CODE_FOR_KBD" nil org-hugo-use-code-for-kbd)
                     (:hugo-prefer-hyphen-in-tags "HUGO_PREFER_HYPHEN_IN_TAGS" nil org-hugo-prefer-hyphen-in-tags)
                     (:hugo-allow-spaces-in-tags "HUGO_ALLOW_SPACES_IN_TAGS" nil org-hugo-allow-spaces-in-tags)
                     (:hugo-auto-set-lastmod "HUGO_AUTO_SET_LASTMOD" nil org-hugo-auto-set-lastmod)
                     (:hugo-custom-front-matter "HUGO_CUSTOM_FRONT_MATTER" nil nil space)
                     (:hugo-blackfriday "HUGO_BLACKFRIDAY" nil nil space)
                     (:hugo-front-matter-key-replace "HUGO_FRONT_MATTER_KEY_REPLACE" nil nil space)
                     (:hugo-date-format "HUGO_DATE_FORMAT" nil org-hugo-date-format)
                     (:hugo-paired-shortcodes "HUGO_PAIRED_SHORTCODES" nil org-hugo-paired-shortcodes space)
                     (:hugo-pandoc-citations "HUGO_PANDOC_CITATIONS" nil nil)
                     (:bibliography "BIBLIOGRAPHY" nil nil newline) ;Used in ox-hugo-pandoc-cite

                     ;; Front-matter variables
                     ;; https://gohugo.io/content-management/front-matter/#front-matter-variables
                     ;; aliases
                     (:hugo-aliases "HUGO_ALIASES" nil nil space)
                     ;; audio
                     (:hugo-audio "HUGO_AUDIO" nil nil)
                     ;; date
                     ;; "date" is parsed from the Org #+date or subtree property EXPORT_HUGO_DATE
                     (:date "DATE" nil nil)
                     ;; description
                     (:description "DESCRIPTION" nil nil)
                     ;; draft
                     ;; "draft" value interpreted by the TODO state of a
                     ;; post as Org subtree gets higher precedence.
                     (:hugo-draft "HUGO_DRAFT" nil nil)
                     ;; expiryDate
                     (:hugo-expirydate "HUGO_EXPIRYDATE" nil nil)
                     ;; headless (only for Page Bundles - Hugo v0.35+)
                     (:hugo-headless "HUGO_HEADLESS" nil nil)
                     ;; images
                     (:hugo-images "HUGO_IMAGES" nil nil newline)
                     ;; isCJKLanguage
                     (:hugo-iscjklanguage "HUGO_ISCJKLANGUAGE" nil nil)
                     ;; keywords
                     ;; "keywords" is parsed from the Org #+keywords or
                     ;; subtree property EXPORT_KEYWORDS.
                     (:keywords "KEYWORDS" nil nil newline)
                     ;; layout
                     (:hugo-layout "HUGO_LAYOUT" nil nil)
                     ;; lastmod
                     (:hugo-lastmod "HUGO_LASTMOD" nil nil)
                     ;; linkTitle
                     (:hugo-linktitle "HUGO_LINKTITLE" nil nil)
                     ;; locale (used in Hugo internal templates)
                     (:hugo-locale "HUGO_LOCALE" nil nil)
                     ;; markup
                     (:hugo-markup "HUGO_MARKUP" nil nil) ;default is "md"
                     ;; menu
                     (:hugo-menu "HUGO_MENU" nil nil space)
                     (:hugo-menu-override "HUGO_MENU_OVERRIDE" nil nil space)
                     ;; outputs
                     (:hugo-outputs "HUGO_OUTPUTS" nil nil space)
                     ;; publishDate
                     (:hugo-publishdate "HUGO_PUBLISHDATE" nil nil)
                     ;; series
                     (:hugo-series "HUGO_SERIES" nil nil newline)
                     ;; slug
                     (:hugo-slug "HUGO_SLUG" nil nil)
                     ;; taxomonomies - tags, categories
                     (:hugo-tags "HUGO_TAGS" nil nil newline)
                     ;; #+hugo_tags are used to set the post tags in Org
                     ;; files written for file-based exports.  But for
                     ;; subtree-based exports, the EXPORT_HUGO_TAGS
                     ;; property can be used to override inherited tags
                     ;; and Org-style tags.
                     (:hugo-categories "HUGO_CATEGORIES" nil nil newline)
                     ;; #+hugo_categories are used to set the post
                     ;; categories in Org files written for file-based
                     ;; exports.  But for subtree-based exports, the
                     ;; EXPORT_HUGO_CATEGORIES property can be used to
                     ;; override inherited categories and Org-style
                     ;; categories (Org-style tags with "@" prefix).
                     ;; resources
                     (:hugo-resources "HUGO_RESOURCES" nil nil space)
                     ;; title
                     ;; "title" is parsed from the Org #+title or the subtree heading.
                     ;; type
                     (:hugo-type "HUGO_TYPE" nil nil)
                     ;; url
                     (:hugo-url "HUGO_URL" nil nil)
                     ;; videos
                     (:hugo-videos "HUGO_VIDEOS" nil nil newline)
                     ;; weight
                     (:hugo-weight "HUGO_WEIGHT" nil nil space)))

  (defcustom local-server-base-path "/usr/share/nginx/html/"
    "Websites should be published inside this directory.")

  (defun hugo-render ()
    "Render exported md to html from contents dir to local web server dir.
  Issue a single command like this:
  hugo -b <base url> -c <path to md contents dir> -d <path to local website dir>
  For example:
  hugo -b http://localhost/tests/test2/ -c /home/iani/Dev/SITES/learn1/content -d /usr/share/nginx/html/tests/test2/
  "
    (interactive)
    (let* ((subtreep nil)
           (visible-only nil)
           (info
            (org-combine-plists
             (org-export--get-export-attributes
              'hugo subtreep visible-only)
             (org-export--get-buffer-attributes)
             (org-export-get-environment 'hugo subtreep)))
           (export-base-dir
            (concat
             (file-name-directory
              (directory-file-name
               (file-name-directory (directory-file-name (org-hugo--get-pub-dir info)))))
             "public/"))
           (site-target-subdir (or (plist-get info :site-target-subdir) "/"))
           )
      (message "export base dir is: %s" ;; (plist-get info :hugo-base-dir)
               export-base-dir)
      ;; (message "site-target-dubdir is: %s" (plist-get info :site-target-subdir))
      ))
(provide 'hugo-render-and-copy_code)
;;; 038_hugo-render-and-copy_code.el ends here
