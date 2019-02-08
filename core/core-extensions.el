;;; package --- extensions configs
;;; Commentary:
;;; Contains my extensions configs

;;; Code:

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file))


(use-package counsel-projectile
  :bind
  ("C-p" . counsel-projectile-find-file)
  :config
  (counsel-projectile-on))


(use-package flycheck
  :config
  (setq flycheck-indication-mode 'right-fringe
      ;; Removed checks on idle/change for snappiness
      flycheck-check-syntax-automatically '(save mode-enabled)
      flycheck-highlighting-mode 'symbols
      flycheck-disabled-checkers '(emacs-lisp emacs-lisp-checkdoc make)
      ;; `flycheck-pos-tip'
      flycheck-pos-tip-timeout 10
      flycheck-display-errors-delay 0.5)
  (when (eq window-system 'mac)
    (require 'flycheck-pos-tip)
    (flycheck-pos-tip-mode +1))
  ;; Enable flycheck
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package git-gutter
  :config
  (setq git-gutter:update-interval 2))

(use-package hl-line
  :config
  ;; Doesn't seem to play nice in emacs 25+
  (setq hl-line-sticky-flag nil
        global-hl-line-sticky-flag nil)

  (defvar-local current-hl-line-mode nil)
  (defun hl-line-on ()  (if current-hl-line-mode (hl-line-mode +1)))
  (defun hl-line-off () (if current-hl-line-mode (hl-line-mode -1)))
  ;;(add-hook hl-line-mode (lambda () (if current-hl-line-mode (setq current-hl-line-mode t))))
  (global-hl-line-mode))

(use-package hlinum
  :config
  (hlinum-activate))

(use-package linum
  :config
  (setq linum-format " %3d ")
  (global-linum-mode nil))


(use-package multiple-cursors
  :config
  (setq mc/list-file (concat temp-dir "/.mc-lists.el")))


(use-package org
  :config
  (setq org-directory "~/org"
        org-agenda-files (list "work.org"))
  (org-babel-do-load-languages
   'org-babel-load-languages '((ruby . t)))
  :bind
  ("\C-cl" . org-store-link)
  ("\C-ca" . org-agenda))

(use-package org-projectile
  :bind (("C-c n p" . org-projectile:project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (org-projectile:per-repo)
    (setq org-projectile:per-repo-filename "todo.org"
	org-agenda-files (append org-agenda-files (org-projectile:todo-files)))
    (add-to-list 'org-capture-templates (org-projectile:project-todo-entry "p")))
  :ensure t)

(use-package org-bullets
  :config
  (setq org-hide-leading-stars t)
  (add-hook 'org-mode-hook
            (lambda ()
              (org-bullets-mode t))))


(use-package projectile
  :config
  (setq projectile-enable-caching t
	projectile-cache-file (expand-file-name "projectile.cache" temp-dir)
	projectile-known-projects-file (expand-file-name "projectile-bookmarks.eld" temp-dir)
	projectile-globally-ignored-files (append '("*.txt" "*.o" "*.so" "*.log") projectile-globally-ignored-files)
	projectile-globally-ignored-directories (append '("tmp") projectile-globally-ignored-files))
  (setq projectile-completion-system 'ivy)
  (projectile-global-mode))


(use-package smartparens
  :config
  (require 'smartparens-config)
  (smartparens-global-mode)
  (sp-pair "%" "%")
  (sp-pair "<" ">"))


(use-package windmove
  :bind
  ("C-x <up>" . windmove-up)
  ("C-x <down>" . windmove-down)
  ("C-x <left>" . windmove-left)
  ("C-x <right>" . windmove-right))


(use-package neotree
  :config
  (setq neo-theme 'arrow
        neotree-smart-optn t
        neo-window-fixed-size nil)
  (setq projectile-switch-project-action 'neotree-projectile-action)
  ;; Disable linum for neotree
  (add-hook 'neo-after-create-hook 'disable-neotree-hook))
;(add-hook 'after-init-hook #'neotree-toggle)

(provide 'core-extensions)
