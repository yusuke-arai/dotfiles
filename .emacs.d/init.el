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


;; ==================== Haskell ====================
;; Required packages are:
;; * haskell-mode
;; * ghc
;; * company-ghc

; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
; HaRe
(add-to-list 'load-path "/home/arai/.stack/snapshots/x86_64-linux-nix/lts-8.23/8.0.2/share/x86_64-linux-ghc-8.0.2/HaRe-0.8.4.0/elisp")(require 'hare)
(autoload 'hare-init "hare" nil t)
; haskell-mode
(add-hook 'haskell-mode-hook
          (lambda ()
            (ghc-init)
            (hare-init)
            (define-key haskell-mode-map (kbd "C-c b") 'haskell-mode-jump-to-def-or-tag)
            (define-key haskell-mode-map (kbd "C-c t") 'haskell-mode-show-type-at)
            ))
; company-ghc
(require 'company)
(add-hook 'haskell-mode-hook 'company-mode)
(add-to-list 'company-backends 'company-ghc)


;; ==================== PHP ====================
;; Required packages are:
;; * php-mode
;; * ac-php

; ac-php
(add-hook 'php-mode-hook
          '(lambda ()
            (require 'ac-php)
            (auto-complete-mode t)
            (setq ac-sources  '(ac-source-php ) )
            (yas-global-mode 1)
            (define-key php-mode-map  (kbd "C-c b") 'ac-php-find-symbol-at-point)   ;goto define
            ;(define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back   ) ;go back
            ))
(add-hook 'php-mode-hook
          '(lambda ()
            (require 'company-php)
            (company-mode t)
            (add-to-list 'company-backends 'company-ac-php-backend )
            ))

;; ==================== ElScreen ====================
;; Required packages are:
;; * elscreen
;(elscreen-start)
