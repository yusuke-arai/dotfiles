set tabstop=2
set shiftwidth=2
set expandtab
set number
syntax on

set encoding=utf-8
set backspace=indent,eol,start
set ambiwidth=double

if has('win32')
else
  set directory=/tmp
endif

"GUI
if has('gui_running')
  color desert
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove tool bar
  set guifont=Migu_1M:h14
  set lines=40 columns=200 "window size
  autocmd GUIEnter * simalt ~x
endif

"現在時刻を挿入
imap <silent> <C-T>>=strftime("%H:%M")<CR>
