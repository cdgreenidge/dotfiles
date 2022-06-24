;; Bootstrap straight and use-package
;; We have to do this before loading the literate config because otherwise
;; we will accidentally load an old, incomaptible version of org-mode

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Load our config
(org-babel-load-file "~/.config/emacs/config.org")
