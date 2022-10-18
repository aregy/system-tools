Content-Type: text/enriched
Text-Width: 70

<x-color><param>#5F7F5F</param>;;; </x-color><x-color><param>#7F9F7F</param>package --- Summary

</x-color><x-color><param>#5F7F5F</param>;;; </x-color><x-color><param>#7F9F7F</param>Commentary:

</x-color><x-color><param>#5F7F5F</param>;;; </x-color><x-color><param>#7F9F7F</param>Code:

</x-color><x-color><param>#5F7F5F</param>;;; </x-color><x-color><param>#7F9F7F</param>note: flycheck-clang-language-standard needs to be set as a directory(-scoped) variable to nullify c++11 warnings

</x-color>

(set-frame-size (selected-frame) 120 50)

(scroll-bar-mode -1)

(<bold><x-color><param>#F0DFAF</param>if</x-color></bold> (eq system-type 'darwin)

  <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>MacOS modifier keys

</x-color>  (<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> ns-command-modifier 'meta)

  (<bold><x-color><param>#F0DFAF</param>if</x-color></bold> (eq system-type 'windows-nt)

    <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>#Win11 OpenSSL pathing issue

</x-color>    (<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> package-check-signature nil)))
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> inhibit-startup-screen t)

(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> show-trailing-whitespace t)

<center>(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> visible-bell nil)

</center>(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> ring-bell-function (<bold><x-color><param>#F0DFAF</param>lambda</x-color></bold> ()

  (invert-face 'mode-line)

  (run-with-timer

   0.1 nil

   (<bold><x-color><param>#F0DFAF</param>lambda</x-color></bold> ()

     (invert-face 'mode-line)))))

(server-start)
(<bold><x-color><param>#F0DFAF</param>require</x-color></bold> '<x-color><param>#BFEBBF</param>package</x-color>)

(tool-bar-mode 0)

(display-time-mode)

(add-to-list 'package-archives '(<x-color><param>#CC9393</param>"melpa"</x-color> . <x-color><param>#CC9393</param>"http://melpa.org/packages/"</x-color>) t)

(package-initialize)
(<bold><x-color><param>#F0DFAF</param>unless</x-color></bold> (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))
<x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>(set-frame-font "Monaco 16")

</x-color>(set-face-attribute 'default nil <bold><x-color><param>#DCDCCC</param>:family</x-color></bold> <x-color><param>#CC9393</param>"Courier New"</x-color> <bold><x-color><param>#DCDCCC</param>:height</x-color></bold> 160)

(set-fontset-font (face-attribute 'default <bold><x-color><param>#DCDCCC</param>:fontset</x-color></bold>)
                  '(#x0530 . #x058F)        <x-color><param>#CC9393</param>"Arti v05"</x-color> nil 'append)

<x-color><param>#5F7F5F</param>;;</x-color><x-color><param>#7F9F7F</param>(set-face-attribute 'default nil :family "Arti v05" :height 140)

</x-color><x-color><param>#5F7F5F</param>;;</x-color><x-color><param>#7F9F7F</param>(set-face-attribute 'default nil :family "ArmGuard_U" :height 140)

</x-color><x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>From https://github.com/kaz-yos/emacs see  emacs/init.d/200_language-and-font-related.el

</x-color>(invert-face 'mode-line)
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> create-lockfiles nil)
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> auto-save-default nil)

(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>company</x-color> <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t <bold><x-color><param>#DCDCCC</param>:init</x-color></bold> (global-company-mode))
<x-color><param>#5F7F5F</param>;;</x-color><x-color><param>#7F9F7F</param>(add-hook 'after-init-hook 'global-company-mode)
</x-color>(add-hook 'prog-mode-hook 'company-mode)
(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>company-statistics</x-color>

  <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t
  <bold><x-color><param>#DCDCCC</param>:config</x-color></bold>
  (company-statistics-mode))
(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>company-go</x-color>

  <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t
  <bold><x-color><param>#DCDCCC</param>:init</x-color></bold>
  (add-to-list 'company-backends 'company-go))
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> company-minimum-prefix-length 1)
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> company-idle-delay 0.25)
(<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> company-echo-delay 0)
(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>flycheck</x-color> <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t

  <bold><x-color><param>#DCDCCC</param>:init</x-color></bold> (global-flycheck-mode))

(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>flycheck-rust</x-color> <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t)

(<bold><x-color><param>#F0DFAF</param>with-eval-after-load</x-color></bold> 'rust-mode

  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(add-hook 'c++-mode-hook

  (<bold><x-color><param>#F0DFAF</param>lambda</x-color></bold>() (<bold><x-color><param>#F0DFAF</param>setq</x-color></bold> flycheck-clang-language-standard <x-color><param>#CC9393</param>"c++11"</x-color>)))
<x-color><param>#5F7F5F</param>;;</x-color><x-color><param>#7F9F7F</param>(global-display-line-numbers-mode 0)

</x-color>(<bold><x-color><param>#F0DFAF</param>defun</x-color></bold> <x-color><param>#93E0E3</param>init:goto-line</x-color> (x)

  <x-color><param>#9FC59F</param>"A ''</x-color><x-color><param>#BFEBBF</param><x-color><param>#9FC59F</param>goto-line</x-color></x-color><x-color><param>#9FC59F</param>'' alternative to move X lines forward with minimal clutter."</x-color>

  (<bold><x-color><param>#F0DFAF</param>interactive</x-color></bold> <x-color><param>#CC9393</param>"sLine #"</x-color>)

  (display-line-numbers-mode)

  (forward-line x)

  (display-line-numbers-mode))
(global-set-key (kbd <x-color><param>#CC9393</param>"C-x l"</x-color>) 'display-line-numbers-mode)

(global-set-key (kbd <x-color><param>#CC9393</param>"C-x l"</x-color>) 'init:goto-line)

(global-set-key (kbd <x-color><param>#CC9393</param>"C-c k"</x-color>) 'windmove-up)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c K"</x-color>) 'windmove-swap-states-up)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c j"</x-color>) 'windmove-down)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c J"</x-color>) 'windmove-swap-states-down)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c h"</x-color>) 'windmove-left)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c H"</x-color>) 'windmove-swap-states-left)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c l"</x-color>) 'windmove-right)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-c L"</x-color>) 'windmove-swap-states-right)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-x p"</x-color>) 'previous-buffer)
(global-set-key (kbd <x-color><param>#CC9393</param>"C-x n"</x-color>) 'next-buffer)

(menu-bar--display-line-numbers-mode-relative)

(<bold><x-color><param>#F0DFAF</param>defun</x-color></bold> <x-color><param>#93E0E3</param>init.el:toggle-line-numbers</x-color> ()

  <x-color><param>#9FC59F</param>"Toggle line numbers."</x-color>

  (<bold><x-color><param>#F0DFAF</param>interactive</x-color></bold>)

  (display-line-numbers-mode 'toggle)

)

(global-set-key (kbd <x-color><param>#CC9393</param>"C-`"</x-color>) 'init.el:toggle-line-numbers)
<x-color><param>#5F7F5F</param>;;; </x-color><x-color><param>#7F9F7F</param>Init.el ends here
</x-color>(custom-set-variables
 <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>custom-set-variables was added by Custom.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>If you edit it by hand, you could mess it up, so be careful.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>Your init file should contain only one such instance.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>If there is more than one, they won't work right.
</x-color> '(custom-safe-themes

   '(<x-color><param>#CC9393</param>"c4cecd97a6b30d129971302fd8298c2ff56189db0a94570e7238bc95f9389cfb"</x-color> default))
 '(package-selected-packages

   '(flycheck-rust zenburn-theme visual-regexp use-package typescript-mode solarized-theme rust-mode multiple-cursors helm flycheck evil company-statistics company-go anki-editor anki-connect ace-jump-mode)))
(custom-set-faces
 <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>custom-set-faces was added by Custom.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>If you edit it by hand, you could mess it up, so be careful.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>Your init file should contain only one such instance.
</x-color> <x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>If there is more than one, they won't work right.
</x-color> )
(put 'downcase-region 'disabled nil)

(<bold><x-color><param>#F0DFAF</param>defun</x-color></bold> <x-color><param>#93E0E3</param>onpressed</x-color> ()

  <x-color><param>#9FC59F</param>"Response to key pressed.

Currently a kludge of meta key depression state"</x-color>

    (message <x-color><param>#CC9393</param>"Meta pressed"</x-color>)

)
<x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>(global-set-key (kbd "M-j") 'onpressed)

</x-color><x-color><param>#5F7F5F</param>;; </x-color><x-color><param>#7F9F7F</param>(globalunset-key (kbd "M"))

</x-color>(<bold><x-color><param>#F0DFAF</param>use-package</x-color></bold> <x-color><param>#BFEBBF</param>zenburn-theme</x-color> <bold><x-color><param>#DCDCCC</param>:ensure</x-color></bold> t <bold><x-color><param>#DCDCCC</param>:config</x-color></bold> (load-theme 'zenburn))
(set-cursor-color <x-color><param>#CC9393</param>"#96B192"</x-color>)

