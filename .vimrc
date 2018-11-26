set tabstop=4
set expandtab
set number
syntax on

set encoding=utf-8
set backspace=indent,eol,start
set ambiwidth=double
set directory=/tmp

"for Windows
if has('gui_running')
  color desert
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove tool bar
  set guifont=Migu_2M:h14
  set lines=40 columns=200 "window size
  autocmd GUIEnter * simalt ~x

  imap <silent> <C-T> <C-R>=strftime("%H:%M")<CR>
endif

