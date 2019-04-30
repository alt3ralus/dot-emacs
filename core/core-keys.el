
;; Set global keys not specific to a certain package


;; navigate in buffers
(global-set-key [C-iso-lefttab] 'switch-to-prev-buffer)
(global-set-key [C-tab] 'switch-to-next-buffer)


;; personal shortcuts
(global-set-key (kbd "C-S-x") 'kill-region)
(global-set-key (kbd "C-S-v") 'yank)
(global-set-key (kbd "C-S-c") 'kill-ring-save)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-w") 'kill-buffer)
(global-set-key (kbd "C-;") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-z") 'undo)

(global-set-key (kbd "C-c s") 'yas-insert-snippet)

(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-S-f") 'projectile-grep)

(add-hook 'isearch-mode-hook
 (lambda ()
 (define-key isearch-mode-map (kbd "C-f") 'isearch-repeat-forward)
 )
)

(global-set-key (kbd "<ESC><up>") 'move-text-up)
(global-set-key (kbd "<ESC><down>") 'move-text-down)

(global-set-key (kbd "M-S-<up>") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-S-<down>") 'mc/mark-next-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(global-set-key (kbd "C-\\") 'neotree-project-root-dir-or-current-dir)
(global-set-key (kbd "C-\º") 'neotree-project-root-dir-or-current-dir)

(global-set-key (kbd "C-x g d") 'git-gutter:popup-diff)

(provide 'core-keys)
