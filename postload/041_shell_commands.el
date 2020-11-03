;; some shell commands
;; using recipe for running some of these as sudo, adapted from:
;; https://stackoverflow.com/questions/2472273/how-do-i-run-a-sudo-command-in-emacs

(defun unmount-all-external-disks ()
  (interactive)
  (shell-command (concat "echo " (shell-quote-argument (read-passwd "Password? "))
                         " | sudo -S umount /run/media/iani/*")))
