;; Emacs全体の設定
;; --------------------------------------------------------------

; メニューバーを消す
(menu-bar-mode 0)

; C-h をバックスペースにする
(global-set-key "\C-h" 'delete-backward-char)

; バックアップファイルを作らない
(setq make-backup-files nil)

; タブはスペースに展開する
(setq-default indent-tabs-mode nil)

; 画面表示をUTF-8にする
(set-terminal-coding-system 'utf-8)
; キーボードの入力をUTF-8にする
(set-keyboard-coding-system 'utf-8)
; ファイルのバッファのデフォルト文字コードをUTF-8にする
(set-buffer-file-coding-system 'utf-8)
; バッファのプロセスの文字コードをUTF-8にする
(setq default-buffer-file-coding-system 'utf-8)
; ファイルの文字コードをUTF-8にする
(setq file-name-coding-system 'utf-8)
; 新規作成ファイルの文字コードをUTF-8にする
(set-default-coding-systems 'utf-8)


;; パッケージ
;; --------------------------------------------------------------
(require 'package)

(defvar package-list
  '(intero
    php-mode
    ac-php)
  "Packages to be installed")
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(unless package-archive-contents (package-refresh-contents))
(dolist (pkg package-list)
  (unless (package-installed-p pkg)
    (package-install pkg)))


;; Haskell
;; --------------------------------------------------------------

; ファイル保存時にstylish-haskellを実行
(custom-set-variables '(haskell-stylish-on-save t))
; Interoをhaskell-modeで常に有効化
(intero-global-mode 1)
; hlintを有効化
(flycheck-add-next-checker 'intero '(warning . haskell-hlint))

; HaRe
(add-to-list 'load-path "/home/arai/.stack/snapshots/x86_64-linux-nix/lts-8.23/8.0.2/share/x86_64-linux-ghc-8.0.2/HaRe-0.8.4.0/elisp")(require 'hare)
(autoload 'hare-init "hare" nil t)
; haskell-mode
(add-hook 'haskell-mode-hook
          (lambda ()
            (hare-init)
            ))


;; PHP
;; --------------------------------------------------------------

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
