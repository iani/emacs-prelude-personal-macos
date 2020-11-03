;;; sclang_mode_keybindings --- 2019-06-29 08:08:22 AM
;;; Commentary:

;; free prefixes and allocation for hydras
;; C-S-c + any key except C-S-c and c.
;; possible allocations:
;; lang: l, server: s, snippets: S, osc: o,  midi: m

;; other free prefixes:
;; C-S
;; C-L sclang
;; C-T
;; C-B

;; commands to allocate - in groups
;; server group:
;; boot, quit, meter, scope, freqscope, record, stoprecording, kill all servers

;; lang group:
;; start, stop, recompile, view extensions, help, open startup, open extensions

;; snippet group
;; open snippets, next, previous, eval, eval next, eval previous, copy, select,
;; duplicate, cut, move down, move up

;; osc group: trace on, trace off

;; midi group:

  ;;; Code:
(setq sclang-show-workspace-on-startup nil)

(eval-after-load 'sclang
  (progn
    ;; these are disabled by sclang-bindings:
    ;; (define-key sclang-mode-map (kbd "C-c C-p t") 'sclang-server-plot-tree)
    ;; (define-key sclang-mode-map (kbd "C-c C-p m") 'sclang-server-meter)
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; sc-hacks gui commands:
    (define-key sclang-mode-map (kbd "C-h g s") 'sclang-startupfiles-gui)
    (define-key sclang-mode-map (kbd "C-h g a") 'sclang-audiofiles-gui)
    (define-key sclang-mode-map (kbd "C-h g p") 'sclang-players-gui)
    (define-key sclang-mode-map (kbd "C-h g e") 'sclang-extensions-gui)
    (define-key sclang-mode-map (kbd "C-h g n") 'sclang-nevent-gui)
    (define-key sclang-mode-map (kbd "C-S-s") 'hydra-snippets/body)
    (define-key sclang-mode-map (kbd "C-S-l") 'hydra-sclang/body)
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Server state visualisation utilities
    ;; TODO: Check and re-assign these commands for consistency with
    ;; default sclang commands C-c C-p x:
    (define-key sclang-mode-map (kbd "C-c P p") 'sclang-server-plot-tree)
    (define-key sclang-mode-map (kbd "C-c P m") 'sclang-server-meter)
    (define-key sclang-mode-map (kbd "C-c P s") 'sclang-server-scope)
    (define-key sclang-mode-map (kbd "C-c P f") 'sclang-server-freqscope)
   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
       ;;;;;;;;;;;;;;;;;;       snippet commands      ;;;;;;;;;;;;;;;;;;
    ;; eval current snippet               M-C-x
    ;; goto next snippet                  M-n
    ;; goto previous snippet              M-p
    ;; eval previous snippet              M-P
    ;; eval next snippet                  M-N
    ;; duplicate current snippet          M-D
    ;; copy current snippet               M-C
    ;; select region of current snippet   M-R
    ;; cut current snippet                M-T
    ;; transpose snippet down             C-M-N
    ;; transpose snippet up               C-M-P

    (define-key sclang-mode-map (kbd "M-X") 'sclang-eval-current-snippet)
    (define-key sclang-mode-map (kbd "C-<return>") 'sclang-eval-current-snippet)
    (define-key sclang-mode-map (kbd "C-M-x") 'sclang-eval-current-snippet)
    (define-key sclang-mode-map (kbd "M-n") 'sclang-goto-next-snippet)
    (define-key sclang-mode-map (kbd "M-p") 'sclang-goto-previous-snippet)
    (define-key sclang-mode-map (kbd "M-N") 'sclang-eval-next-snippet)
    (define-key sclang-mode-map (kbd "M-P") 'sclang-eval-previous-snippet)
    (define-key sclang-mode-map (kbd "M-D") 'sclang-duplicate-current-snippet)
    (define-key sclang-mode-map (kbd "M-C") 'sclang-copy-current-snippet)
    (define-key sclang-mode-map (kbd "M-R") 'sclang-region-select-current-snippet)
    (define-key sclang-mode-map (kbd "M-T") 'sclang-cut-current-snippet)
    (define-key sclang-mode-map (kbd "C-M-N") 'sclang-transpose-snippet-down)
    (define-key sclang-mode-map (kbd "C-M-P") 'sclang-transpose-snippet-up)

    (define-key sclang-mode-map (kbd "C-M-S-t")
      'sclang-eval-current-snippet-with-timer)

    ;; (define-key sclang-mode-map (kbd "M-C-.") 'sclang-duplicate-current-snippet)
    ;; (define-key sclang-mode-map (kbd "M-n") 'sclang-goto-next-snippet)
    ;; (define-key sclang-mode-map (kbd "M-N") 'sclang-eval-next-snippet)
    ;; (define-key sclang-mode-map (kbd "M-C-S-n") 'sclang-move-snippet-down)
    ;; (define-key sclang-mode-map (kbd "M-p") 'sclang-goto-previous-snippet)
    ;; (define-key sclang-mode-map (kbd "M-P") 'sclang-eval-previous-snippet)
    ;; (define-key sclang-mode-map (kbd "M-C-S-p") 'sclang-move-snippet-up)X

    (define-key sclang-mode-map (kbd "H-=") 'sclang-insert-snippet-separator+)
    (define-key sclang-mode-map (kbd "H-8") 'sclang-insert-snippet-separator*)

       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    ;; Miscellaneous
    (define-key sclang-mode-map (kbd "C-S-c c") 'sclang-clear-post-buffer)

    (key-chord-define sclang-mode-map "11" 'sclang-2-windows)
    ;; (key-chord-define sclang-mode-map "''" 'sclang-plusgt)
    ;; (key-chord-define sclang-mode-map ";;" 'sclang-ltplus)
    ;; (key-chord-define sclang-mode-map "\\\\" 'sclang-xgt)
    (whitespace-mode -1)
    ))


;;; also disable whitespace mode in sclang mode
(add-hook 'sclang-mode-hook (lambda () (whitespace-mode 0)))

(provide 'sclang_mode_keybindings)
;;; 022_sclang_mode_keybindings.el ends here
