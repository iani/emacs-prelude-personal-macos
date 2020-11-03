;; 28 Sep 2020 15:19 enable execution of sclang code from
;; org-mode babel source blocks

(defun org-babel-execute:sclang (body params)
  "Execute a block of sclang code with Babel."
  (sclang-eval-string body t))
