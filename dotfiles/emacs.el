(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
;; (when (boundp 'image-types)
;;     (setq image-types (cons 'svg image-types))
;;     (setq image-types '('svg)))
(setq inhibit-startup-message t)
;; mostly directly and shamelessly lifted from Brent Westbrook's emacs
;; config for go-mode+lsp-mode+company-mode support
;; https://github.com/ntBre/yt-configs/blob/c193e48dc205c844c3fbece86ceec65a571b2608/.emacs.d/init.el#L4
;; https://www.youtube.com/watch?v=UFPD7icMoHY

;; -*- lexical-binding: t; outline-regexp: ";;;"; eval: (local-set-key (kbd "C-c i") #'consult-outline); -*-

(require 'package)
(package-initialize)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(require 'use-package)

;;; evil
(use-package evil
  :ensure t
  :config
  (evil-mode)
  (evil-set-undo-system 'undo-redo)
  (defmacro brw/fix-evil-hook (hook state key fn)
    `(add-hook ',hook
	       (lambda ()
		 (evil-local-set-key ',state (kbd ,key) ',fn))))
  (brw/fix-evil-hook xref--xref-buffer-mode-hook motion "RET" xref-goto-xref)
  (brw/fix-evil-hook flycheck-error-list-mode-hook motion "RET" flycheck-error-list-goto-error)
  (mapcar
   #'(lambda (lst)
       (evil-set-initial-state (car lst) (cdr lst)))
   '((xref--xref-buffer-mode   . motion)
    (flycheck-error-list-mode . motion))))

(use-package rainbow-mode
  :ensure t)

(use-package vertico
  :ensure t
  :config
  (vertico-mode))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode))

(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless)))

(use-package consult
  :ensure t)
(add-to-list 'image-types 'svg) ;;added by AY for MacOS after installing librsvg
;; (use-package treemacs
;;   :ensure t
;; )
;; (use-package treemacs-evil
;;   :ensure t)
;; 
(use-package winum
  :ensure t
  :config
;;  (global-set-key (kbd "M-0") 'treemacs-select-window)
  (global-set-key (kbd "M-1") 'winum-select-window-1)
  (global-set-key (kbd "M-2") 'winum-select-window-2)
  (global-set-key (kbd "M-3") 'winum-select-window-3)
  (global-set-key (kbd "M-4") 'winum-select-window-4)
  (global-set-key (kbd "M-5") 'winum-select-window-5)
  (global-set-key (kbd "M-6") 'winum-select-window-6)
  (global-set-key (kbd "M-7") 'winum-select-window-7)
  (global-set-key (kbd "M-8") 'winum-select-window-8)
  (winum-mode))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))
(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
	      ("C-c d" . lsp-describe-thing-at-point)
	      ("C-c a" . lsp-execute-code-action)
	      ("<f12>" . lsp-goto-type-definition))
  :bind-keymap ("C-c l" . lsp-command-map)
  :config
  (lsp-enable-which-key-integration t))

(use-package company
  :ensure t
  :hook ((emacs-lisp-mode . (lambda ()
			      (setq-local company-backends '(company-elisp))))
	 (emacs-lisp-mode . company-mode))
  :config
  (company-keymap--unbind-quick-access company-active-map)
  (company-tng-configure-default)
  (setq company-idle-delay 0.1
	company-minimum-prefix-length 1))

(use-package flycheck
  :ensure t)

;;; Rust
(use-package rust-mode
  :ensure t
  :hook ((rust-mode . flycheck-mode)
	 (rust-mode . lsp-deferred))
  :bind (("<f6>" . my/rust-format-buffer))
  :config
  (require 'rust-rustfmt)
  (defun my/rust-format-buffer ()
    (interactive)
    (rust-format-buffer)
    (save-buffer))
  (require 'lsp-rust)
  (setq lsp-rust-analyzer-completion-add-call-parenthesis nil
	lsp-rust-analyzer-proc-macro-enable t)
  (cl-defmethod lsp-clients-extract-signature-on-hover
    (contents (_server-id (eql rust-analyzer)))
    "from https://github.com/emacs-lsp/lsp-mode/pull/1740 to extract
signature in rust"
    (-let* (((&hash "value") contents)
	    (groups (--partition-by (s-blank? it) (s-lines (s-trim value))))
	    (sig_group (if (s-equals? "```rust" (car (-third-item groups)))
			   (-third-item groups)
			 (car groups)))
	    (sig (--> sig_group
		      (--drop-while (s-equals? "```rust" it) it)
		      (--take-while (not (s-equals? "```" it)) it)
		      (--map (s-trim it) it)
		      (s-join " " it))))
	   (lsp--render-element (concat "```rust\n" sig "\n```")))))

;; ;;; Go
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
	 (go-mode . company-mode))
  :bind (:map go-mode-map
	      ("<f6>"  . gofmt)
	      ("C-c 6" . gofmt))
  :config (progn (require 'lsp-go)
				 (setq tab-width 2))
  ;; https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
  (setq lsp-go-analyses
	'((fieldalignment . t)
	  (nilness        . t)
	  (unusedwrite    . t)
	  (unusedparams   . t)))
  ;; GOPATH/bin
  (add-to-list 'exec-path "~/go/bin")
  (setq gofmt-command "goimports"))

;; (use-package go-mode
;;   :ensure t
;;   :hook ((go-mode . lsp-deferred)
;; 	 (go-mode . company-mode))
;;   :bind (:map go-mode-map
;; 	      ("<f6>"  . gofmt)
;; 	      ("C-c 6" . gofmt)
;; 	      (setq tab-width 2))
;;   :config
;;   (require 'lsp-go)
;;   ;; https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
;;   (setq lsp-go-analyses
;; 	'((fieldalignment . t)
;; 	  (nilness        . t)
;; 	  (unusedwrite    . t)
;; 	  (unusedparams   . t)))
;;   ;; GOPATH/bin
;;   (add-to-list 'exec-path "~/go/bin")
;;   (setq gofmt-command "goimports"))
(use-package drag-stuff
  :ensure t
  :config (drag-stuff-global-mode t))
(global-set-key (kbd "<f5>") #'recompile)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file t)

(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/auto-save-list/" t))
      backup-directory-alist
      '(("." . "~/.emacs.d/backups")))
(set-default 'tab-width 4)
(use-package powershell
  :ensure t)


(set-face-attribute 'default nil :height 140)

(tool-bar-mode -1)
(menu-bar-mode -1)
(put 'narrow-to-region 'disabled nil)

;; AY
;;;;; package --- Summary
;;;;; Commentary:
;;;;; Code:
;;;;; note: flycheck-clang-language-standard needs to be set as a directory(-scoped) variable to nullify c++11 warnings
;;(setq backup-directory-alist
;;                `(("." . ,(concat user-emacs-directory "backups"))))
;;(set-frame-size (selected-frame) 120 55)
;;(scroll-bar-mode -1)
;;(if (eq system-type 'narwin)
;;  ;; MacOS modifier keys
;;  (setq ns-command-modifier 'meta)
;;  (if (eq system-type 'windows-nt)
;;    ;; #Win11 OpenSSL pathing issue
;;    (setq package-check-signature nil)))
;;(setq inhibit-startup-screen t)
(setq show-trailing-whitespace t)
		       (setq visible-bell nil)
(setq ring-bell-function (lambda ()
  (invert-face 'mode-line)
  (run-with-timer
   0.1 nil
   (lambda ()
     (invert-face 'mode-line)))))
;;(server-start)
;;(require 'package)
;;(tool-bar-mode 0)
(display-time-mode)
;;(add-to-lisxt 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;;(package-initialize)
;;(unless (package-installed-p 'use-package)
;;(package-refresh-contents)
;;(package-install 'use-package))
;;;; (set-frame-font "Monaco 16")
(if (display-graphic-p)
    (progn
;;      ;; alternative config based option to calling the set-background-color
      ;;      (add-to-list 'default-frame-alist '(background-color . "#FFF1E5"))
	  (scroll-bar-mode -1)
;;;; From https://github.com/kaz-yos/emacs see  emacs/init.d/200_language-and-font-related.el
;;(invert-face 'mode-line)
;;(setq create-lockfiles nil)
;;(setq auto-save-default nil)
;;(use-package lsp-mode :ensure t :init ())
;;(use-package go-mode :ensure t :init ())
;;(use-package company :ensure t :init (global-company-mode))
;;(add-hook 'after-init-hook 'global-company-mode)
;;(add-hook 'prog-mode-hook 'company-mode)
;;(use-package company-statistics
;;  :ensure t
;;  :config
;;  (company-statistics-mode))
;;(use-package company-go
;;  :ensure t
;;  :init
;;  (add-to-list 'company-backends 'company-go))
;;(setq company-minimum-prefix-length 1)
;;(setq company-idle-delay 0.25)
;;(setq company-echo-delay 0)
;;(use-package flycheck :ensure t
;;  :init (global-flycheck-mode))
;;(use-package flycheck-rust :ensure t)
;;(with-eval-after-load 'rust-mode
;;  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
;;(add-hook 'c++-mode-hook
;;  (lambda() (setq flycheck-clang-language-standard "c++11")))
;;;;(global-display-line-numbers-mode 0)
;;(defun init:goto-line (x)
;;  "A ''goto-line'' alternative to move X lines forward with minimal clutter."
;;  (interactive "sLine #")
  (display-line-numbers-mode)
;;  (forward-line x)
;;  (display-line-numbers-mode))
;;(global-set-key (kbd "C-x l") 'display-line-numbers-mode)
;;(global-set-key (kbd "C-x l") 'init:goto-line)
;;(global-set-key (kbd "C-c k") 'windmove-up)
;;(global-set-key (kbd "C-c K") 'windmove-swap-states-up)
;;(global-set-key (kbd "C-c j") 'windmove-down)
;;(global-set-key (kbd "C-c J") 'windmove-swap-states-down)
;;(global-set-key (kbd "C-c h") 'windmove-left)
;;(global-set-key (kbd "C-c H") 'windmove-swap-states-left)
;;(global-set-key (kbd "C-c l") 'windmove-right)
;;(global-set-key (kbd "C-c L") 'windmove-swap-states-right)
;;(global-set-key (kbd "C-x p") 'previous-buffer)
;;(global-set-key (kbd "C-x n") 'next-buffer)
(global-set-key (kbd "<M-up>") 'drag-stuff-up)
(global-set-key (kbd "<M-down>") 'drag-stuff-down)
;;(menu-bar--display-line-numbers-mode-relative)
;;(defun init.el:toggle-line-numbers ()
;;  "Toggle line numbers."
;;  (interactive)
;;  (display-line-numbers-mode 'toggle)
;;)
;;(global-set-key (kbd "C-`") 'init.el:toggle-line-numbers)
;;;;; Init.el ends here
;;(custom-set-variables
;; ;; custom-set-variables was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(custom-safe-themes
;;   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb" default))
;; '(package-selected-packages
;;   '(lsp-mode flycheck-rust company-statistics company-go zenburn-theme visual-regexp use-package typescript-mode solarized-theme rust-mode multiple-cursors helm flycheck anki-editor anki-connect ace-jump-mode)))
;;;;  evil
;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; if there is more than one, they won't work right.
;; )
;;(put 'downcase-region 'disabled nil)
;;(defun onpressed ()
;;  "Response to key pressed.
;;Currently a kludge of meta key depression state"
;;    (message "Meta pressed")
;;)
;;;; (global-set-key (kbd "M-j") 'onpressed)
;;;; (globalunset-key (kbd "M"))
;;(set-cursor-color "#96B192")
;;(set-cursor-color "#332A28")
(global-display-line-numbers-mode t)
(menu-bar--display-line-numbers-mode-relative)
(use-package beacon
  :ensure t
  :config (progn (beacon-mode 1)
		 (setq beacon-blink-duration .1)))
(setq
   gnus-select-method
   `(nnimap
     "proton"
     (nnimap-address "127.0.0.1")
     (nnimap-server-port 1143)
     (nnimap-user "aregy@are.gy")
;;     (nnimap-authenticator xoauth2)
;;     (nnimap-expunge always)
;;     (nnmail-expiry-wait immediate)
     (nnimap-streaming t)
     (nnimap-stream plain)))
;;      (nnimap-stream ssl)))

(use-package zenburn-theme :ensure t :config (load-theme 'zenburn))

      (set-face-background 'cursor "LightBlue3")
      (set-face-foreground 'line-number-current-line "#EBE0B4")
;;      (set-face-attribute 'line-number-current-line nil :background "#383838")
      (set-face-attribute 'line-number-current-line nil :weight 'bold)
;;      (set-foreground-color "#444444")
;;      (set-face-attribute 'region nil :background "lightgreen")
      (set-face-attribute 'default nil :family "IntelOne Mono" :height 120)
      (set-fontset-font (face-attribute 'default :fontset)
                 '(#x0530 . #x058F)        "Arti Porto v01" nil 'append)))
;;;;(set-face-attribute 'default nil :family "Arti v05" :height 140)
;;;;(set-face-attribute 'default nil :family "ArmGuard_U" :height 140)

(when (and (eq system-type 'darwin) (display-graphic-p))
    (progn (setq mac-command-modifier 'meta)
	   (setq mac-option-modifier 'super)))
