set tabstop=4
set expandtab
set number
syntax on

set encoding=utf-8

"for Windows
if has('gui_running')
  color desert
  set guioptions-=m "remove menu bar
  set guioptions-=T "remove tool bar

  imap <silent> <C-T> <C-R>=strftime("%H:%M")<CR>
endif

