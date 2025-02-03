(setq doom-theme 'doom-one)
(setq display-line-numbers-type t)
(setq org-directory "~/org/")


;; keybindings
(map! "C-h" #'evil-window-left
      "C-l" #'evil-window-right
      "C-k" #'evil-window-up
      "C-j" #'evil-window-down)

(map! :m "H" #'previous-buffer
      :m "L" #'next-buffer)

(map! :leader
      "e" #'+treemacs/toggle)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq projectile-project-search-path '("~/Documents/dev"))

;; fonts
(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 13 :weight 'medium)
      doom-theme 'doom-homage-black)

(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override
        '(+workspace-current-name)))

(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))

(pdf-loader-install)

;; nix
(use-package! lsp-nix
  :ensure lsp-mode
  :after (lsp-mode)
  :demand t
  :custom
  (lsp-nix-nil-formatter ["alejandra"])
  (lsp-nix-nil-auto-eval-inputs nil))

(use-package! nix-mode
  :hook (nix-mode . lsp-deferred)
  :ensure t)
