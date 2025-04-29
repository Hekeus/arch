local opt = vim.opt
local cmd = vim.cmd
local g = vim.g


--cmd.colorscheme 'catppuccin'

opt.fileencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.so=999 --курсор в центре экрана
opt.cursorline = true --подсветка текущей строки
opt.number = true --нумерация строк
opt.relativenumber = true --нумерация строк
opt.undofile = true --включить возможность отменять действие клавиша u
opt.shiftwidth = 2 --смещение строки будет равно 2 пробелам 
opt.tabstop = 2 --табуляция равна 2 пробелам
opt.smartindent = true --заменять табы пробелами
opt.ignorecase = true -- игнорировать регистр при поиске
opt.smartcase = true --в случае если в поисковом запросе будет заглавная буква, регистр при поиске включается
opt.showmatch = true -- подсвечивать найденные объекты
opt.clipboard = 'unnamedplus' -- использовать системный буфер обмена
opt.conceallevel = 2
