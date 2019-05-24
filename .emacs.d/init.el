(when window-system
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (tooltip-mode -1))

(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (or (package-installed-p 'use-package)
            (package-installed-p 'diminish))
  (package-refresh-contents)
  (package-install 'use-package)
  (package-install 'diminish))

;; From use-package README
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)

;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#fafafa" "#e45649" "#50a14f" "#986801" "#4078f2" "#a626a4" "#0184bc" "#383a42"])
 '(custom-safe-themes
   (quote
    ("2a85164d198da2174a322b0fc144f3030b8368321804b08ba9c62b388258f958" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "49ec957b508c7d64708b40b0273697a84d3fee4f15dd9fc4a9588016adee3dad" default)))
 '(fci-rule-color "#383a42")
 '(jdee-db-active-breakpoint-face-colors (cons "#f0f0f0" "#4078f2"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#f0f0f0" "#50a14f"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#f0f0f0" "#9ca0a4"))
 '(objed-cursor-color "#C16069")
 '(package-selected-packages
   (quote
    (dracula-theme julia-mode gruvbox-theme python-pytest yaml-mode auctex flycheck-swift format-all swift-mode blacken which-key use-package solarized-theme ripgrep rg pyvenv py-yapf py-isort projectile magit lsp-ui git-gutter flycheck-pycheckers exec-path-from-shell doom-themes diminish counsel company-lsp ace-window)))
 '(vc-annotate-background "#fafafa")
 '(vc-annotate-color-map
   (list
    (cons 20 "#50a14f")
    (cons 40 "#688e35")
    (cons 60 "#807b1b")
    (cons 80 "#986801")
    (cons 100 "#ae7118")
    (cons 120 "#c37b30")
    (cons 140 "#da8548")
    (cons 160 "#c86566")
    (cons 180 "#b74585")
    (cons 200 "#a626a4")
    (cons 220 "#ba3685")
    (cons 240 "#cf4667")
    (cons 260 "#e45649")
    (cons 280 "#d2685f")
    (cons 300 "#c07b76")
    (cons 320 "#ae8d8d")
    (cons 340 "#383a42")
    (cons 360 "#383a42")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
