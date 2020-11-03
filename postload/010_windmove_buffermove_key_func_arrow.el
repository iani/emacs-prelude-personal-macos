;;; windmove_buffermove_key_func_arrow --- 2019-06-29 08:08:21 AM
   (prelude-require-package 'buffer-move)
   (global-set-key (kbd "<home>") 'windmove-left)
   (global-set-key (kbd "<prior>") 'windmove-up)
   (global-set-key (kbd "<end>") 'windmove-right)
   (global-set-key (kbd "<next>") 'windmove-down)

   (global-set-key (kbd "S-<home>") 'buf-move-left)
   (global-set-key (kbd "S-<prior>") 'buf-move-up)
   (global-set-key (kbd "S-<end>") 'buf-move-right)
   (global-set-key (kbd "S-<next>") 'buf-move-down)
(provide 'windmove_buffermove_key_func_arrow)
;;; 010_windmove_buffermove_key_func_arrow.el ends here
