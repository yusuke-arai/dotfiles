# クラス名・関数名・文字列で検索して、該当行でNeovimを開く
# 次のコマンドが必要：fzf
function fif
    # 引数があれば初期クエリとして渡す
    set -l initial_query ""
    if test (count $argv) -gt 0
        set initial_query $argv[1]
    end

    set -l match (env FZF_DEFAULT_COMMAND="rg --color=always --line-number --no-heading --smart-case ''" \
      fzf --ansi \
          --disabled \
          --query "$initial_query" \
          --bind "change:reload:rg --color=always --line-number --no-heading --smart-case {q} || true" \
          --delimiter : \
          --preview 'bat --color=always --style=numbers --highlight-line {2} {1} 2>/dev/null || head -n 100 {1}' \
          --preview-window 'up:60%:wrap')

    # 選択された場合のみNeovimを起動
    if test -n "$match"
        set -l file (echo "$match" | cut -d: -f1)
        set -l line (echo "$match" | cut -d: -f2)
        nvim "+$line" "$file"
    end
end

# 2. ファイル名であいまい検索してNeovimで開く
# 次のコマンドが必要：fdfind、fzf、batcat
function fvv
    set -l file (fdfind --type f --hidden --exclude .git | fzf --preview 'batcat --color=always --style=numbers {} 2>/dev/null || head -n 100 {}')
    if test -n "$file"
        nvim "$file"
    end
end
