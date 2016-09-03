; メニューバーを消す
(menu-bar-mode 0)

; C-h をバックスペースにする
(global-set-key "\C-h" 'delete-backward-char)

; バックアップファイルを作らない
(setq make-backup-files nil)

; タブはスペースに展開する
(setq-default indent-tabs-mode nil)


(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-ghc-show-info t)
 '(haskell-stylish-on-save t)
 '(haskell-tags-on-save t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "https://melpa.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; 初期化
(package-initialize)


;; Haskell用

; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
; HaRe
(add-to-list 'load-path "/Users/yusuke/.stack/snapshots/x86_64-osx/lts-6.14/7.10.3/share/x86_64-osx-ghc-7.10.3/HaRe-0.8.2.3/elisp")(require 'hare)
(autoload 'hare-init "hare" nil t)
; haskell-mode
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (hare-init)
            (define-key haskell-mode-map (kbd "C-c b") 'haskell-mode-jump-to-def-or-tag)
            ))
; company-ghc
(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)


;; ElScreen
(elscreen-start)
