local opt = vim.opt
local g = vim.g

opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "terminal" }
opt.swapfile = false;
opt.termguicolors = true

opt.number = true;
opt.relativenumber = true;
opt.cursorline = true;
opt.wrap = false;
opt.scrolloff = 10;
opt.sidescrolloff = 10;

opt.tabstop = 2;
opt.shiftwidth = 2;
opt.softtabstop = 2;
opt.expandtab = true;
opt.smartindent = true;
opt.autoindent = true;

opt.ignorecase = true;
opt.smartcase = true;
opt.hlsearch = true;
opt.incsearch = true;

opt.signcolumn = 'yes';
opt.colorcolumn = '100';
opt.showmatch = true;
opt.cmdheight = 1;
opt.completeopt = 'menuone,noselect,noinsert';
opt.showmode = false;
opt.pumheight = 10;
opt.pumblend = 10;
opt.winblend = 0;
opt.conceallevel = 0;
opt.concealcursor = '';

opt.clipboard = 'unnamed,unnamedplus'
