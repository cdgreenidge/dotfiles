;; Bootstrap straight and use-package
;; We have to do this before loading the literate config because otherwise
;; we will accidentally load an old, incomaptible version of org-mode

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
(straight-use-package '(org :type built-in))  ; Keep straight from clobbering built-in org
(setq straight-use-package-by-default t)

;; Load our config
(org-babel-load-file "~/.config/emacs/config.org")
