;;; package --- Summary
;;; Commentary:
;;; Code:
;;; note: flycheck-clang-language-standard needs to be set as a directory(-scoped) variable to nullify c++11 warnings
(setq backup-directory-alist
                `(("." . ,(concat user-emacs-directory "backups"))))
(set-frame-size (selected-frame) 120 50)
(scroll-bar-mode -1)
(if (eq system-type 'darwin)
  ;; MacOS modifier keys
  (setq ns-command-modifier 'meta)
  (if (eq system-type 'windows-nt)
    ;; #Win11 OpenSSL pathing issue
    (setq package-check-signature nil)))
(setq inhibit-startup-screen t)
(setq show-trailing-whitespace t)
		       (setq visible-bell nil)
(setq ring-bell-function (lambda ()
  (invert-face 'mode-line)
  (run-with-timer
   0.1 nil
   (lambda ()
     (invert-face 'mode-line)))))
(server-start)
(require 'package)
(tool-bar-mode 0)
(display-time-mode)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))
;; (set-frame-font "Monaco 16")
(set-face-attribute 'default nil :family "JetBrainsMono NF" :height 160)
(set-fontset-font (face-attribute 'default :fontset)
                  '(#x0530 . #x058F)        "Arti Porto v01" nil 'append)
;;(set-face-attribute 'default nil :family "Arti v05" :height 140)
;;(set-face-attribute 'default nil :family "ArmGuard_U" :height 140)
;; From https://github.com/kaz-yos/emacs see  emacs/init.d/200_language-and-font-related.el
(invert-face 'mode-line)
(setq create-lockfiles nil)
(setq auto-save-default nil)
(use-package company :ensure t :init (global-company-mode))
;;(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook 'company-mode)
(use-package company-statistics
  :ensure t
  :config
  (company-statistics-mode))
(use-package company-go
  :ensure t
  :init
  (add-to-list 'company-backends 'company-go))
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.25)
(setq company-echo-delay 0)
(use-package flycheck :ensure t
  :init (global-flycheck-mode))
(use-package flycheck-rust :ensure t)
(with-eval-after-load 'rust-mode
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
(add-hook 'c++-mode-hook
  (lambda() (setq flycheck-clang-language-standard "c++11")))
;;(global-display-line-numbers-mode 0)
(defun init:goto-line (x)
  "A ''goto-line'' alternative to move X lines forward with minimal clutter."
  (interactive "sLine #")
  (display-line-numbers-mode)
  (forward-line x)
  (display-line-numbers-mode))
(global-set-key (kbd "C-x l") 'display-line-numbers-mode)
(global-set-key (kbd "C-x l") 'init:goto-line)
(global-set-key (kbd "C-c k") 'windmove-up)
(global-set-key (kbd "C-c K") 'windmove-swap-states-up)
(global-set-key (kbd "C-c j") 'windmove-down)
(global-set-key (kbd "C-c J") 'windmove-swap-states-down)
(global-set-key (kbd "C-c h") 'windmove-left)
(global-set-key (kbd "C-c H") 'windmove-swap-states-left)
(global-set-key (kbd "C-c l") 'windmove-right)
(global-set-key (kbd "C-c L") 'windmove-swap-states-right)
(global-set-key (kbd "C-x p") 'previous-buffer)
(global-set-key (kbd "C-x n") 'next-buffer)
(menu-bar--display-line-numbers-mode-relative)
(defun init.el:toggle-line-numbers ()
  "Toggle line numbers."
  (interactive)
  (display-line-numbers-mode 'toggle)
)
(global-set-key (kbd "C-`") 'init.el:toggle-line-numbers)
;;; Init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" "c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb" default))
 '(package-selected-packages
   '(flycheck-rust zenburn-theme visual-regexp use-package typescript-mode solarized-theme rust-mode multiple-cursors helm flycheck evil company-statistics company-go anki-editor anki-connect ace-jump-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(defun onpressed ()
  "Response to key pressed.
Currently a kludge of meta key depression state"
    (message "Meta pressed")
)
;; (global-set-key (kbd "M-j") 'onpressed)
;; (globalunset-key (kbd "M"))
(use-package zenburn-theme :ensure t :config (load-theme 'zenburn))
(set-cursor-color "#96B192")
