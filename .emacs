; メニューバーを消す
(menu-bar-mode 0)

; ツールバーを消す
;(tool-bar-mode 0)

; C-h をバックスペースにする
(global-set-key "\C-h" 'delete-backward-char)

; バックアップファイルを作らない
(setq make-backup-files nil)


(require 'package)
;; MELPAを追加
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;; Marmaladeを追加
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; 初期化
(package-initialize)


;; Haskell用
(setq haskell-program-name "/usr/bin/ghci")
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda ()
			       (ghc-init)
			       (define-key global-map "\C-t" 'ghc-complete)
			       (turn-on-haskell-indent)
			       ))
