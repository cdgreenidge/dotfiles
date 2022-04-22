;; Daniel Greenidge's Emacs configuration file
;; First began 2021-04-19

;;; Essentials

;; Bootstrap straight and use-package
(setq straight-recipes-gnu-elpa-use-mirror t)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
	"straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(setq package-enable-at-startup nil)
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Stop Emacs from littering this file with custom variables
(setq custom-file (concat user-emacs-directory "custom.el"))

;; Use option key as meta
(setq mac-option-modifier 'meta)

;; Store backups in tmp directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory )))

;; Set default directory to home
(setq default-directory "~/")
(setq command-line-default-directory "~/")

;; Fix the path
(use-package exec-path-from-shell
  :straight t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package visual-fill-column
  :straight t
  :init
  (add-hook 'org-mode-hook #'visual-fill-column-mode)
  (add-hook 'LaTeX-mode-hook #'visual-fill-column-mode))

(setq-default fill-column 80)

;;; Aesthetics

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)

(set-face-attribute 'default nil :font "IBM Plex Mono-11")
(set-face-attribute 'variable-pitch nil :family "Times New Roman" :height 1.0)
(setq-default line-spacing 0)

(use-package doom-themes
  :straight t
  :config
  (load-theme 'doom-one-light t))

;;; Navigation

(use-package selectrum
  :straight t
  :config
  (selectrum-mode +1))

(use-package selectrum-prescient
  :straight t
  :config
  (selectrum-prescient-mode +1)
  (prescient-persist-mode +1))

(use-package marginalia
  :bind (:map minibuffer-local-map ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package ace-window
  :straight t
  :config
  (global-set-key (kbd "M-o") 'avy-goto-char)
  (global-set-key (kbd "C-c o") 'ace-window))

(use-package which-key
  :straight t
  :config
  (which-key-mode))

;; TODO: install crux and figure it out

;;; Git
(use-package magit
  :straight t)

;;; Latex
(use-package tex
  :ensure auctex
  :straight nil
  :config 	
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq
   TeX-view-program-list
   '(("Preview.app" "open -a Preview.app %o")
     ("Skim" "/Applications/Skim.app/Contents/SharedSupport/displayline %n %o %b")
     ("DISPLAYLINE" "displayline %n %o %b")
     ("open" "open %o"))
   TeX-view-program-selection
   '((output-dvi "open")
     (output-pdf "Skim")
     (output-html "open")))
  :hook ((LaTeX-mode . TeX-source-correlate-mode)
	 (LaTeX-mode . visual-line-mode)))

;;; Nix
(use-package nix-mode
  :mode "\\.nix\\'")

;;; Org Mode
(use-package org
  :straight t
  :init
  (setq org-directory "~/drive/org/")
  (setq org-default-notes-file (concat org-directory "notes.org"))
  (setq org-format-latex-options '(
				   :foreground default
				   :background default
				   :scale 1.0
				   :html-foreground "Black"
				   :html-background "Transparent"
				   :html-scale 1.0
				   :matchers ("begin" "$1" "$" "$$" "\\(" "\\[")))
  (setq org-latex-create-formula-image-program 'dvisvgm)
  (setq org-startup-indented t)
  (setq org-link-frame-setup '((file . find-file)))  ; Open links in same window
  (setq org-log-done 'time)
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  :hook
  ((org-mode . org-indent-mode)
   (org-mode . visual-line-mode)
   (org-mode . (lambda () (text-scale-adjust 2)))
   )
  )

(use-package typopunct
  :straight t
  :config
  (typopunct-change-language 'english t)
  :hook
  (org-mode . typopunct-mode))
  
;; Use proportional fonts in org buffers
(use-package mixed-pitch
  :straight t
  :config
  (setq mixed-pitch-variable-pitch-cursor nil)
  :hook
  (org-mode . mixed-pitch-mode))

(use-package org-roam
  :ensure t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory (file-truename "~/drive/org/roam"))
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find)
         ("C-c n g" . org-roam-graph)
         ("C-c n i" . org-roam-node-insert)
         ("C-c n c" . org-roam-capture)
         ;; Dailies
         ("C-c n j" . org-roam-dailies-capture-today))
  :config
  (org-roam-setup)
  ;; If using org-roam-protocol
  (require 'org-roam-protocol))

;;; Projectile
;; Deprecated, use built-in project.el instead
