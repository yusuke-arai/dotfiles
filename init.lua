vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.number = true
vim.cmd('syntax on')

vim.opt.encoding = 'utf-8'
vim.opt.backspace = 'indent,eol,start'
vim.opt.ambiwidth = 'double'

if (vim.fn.has('win32'))
then
else
  vim.opt.directory = '/tmp'
end
-- GUI
if (vim.fn.exists('g:GuiLoaded'))
then
  --[[
  vim.opt.guifont = 'Migu_1M:h14'
  vim.opt.lines = 40 -- Window size
  vim.opt.columns = 200 -- Window size
  color desert
  set guioptions -= 'm "remove menu bar'
  set guioptions-=T "remove tool bar
  autocmd GUIEnter * simalt ~x
  ]]
end

-- 現在時刻を挿入
vim.api.nvim_set_keymap('i', '<C-T>', vim.fn.strftime("%H:%M"), {})
