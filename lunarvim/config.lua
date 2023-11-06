-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- general
local home = os.getenv("HOME")
package.path = home .. "/.config/lvim/?.lua"

lvim.log.level = "warn"
lvim.format_on_save.enabled = false -- lvim.colorscheme = "lunar"

-- 设置透明度
lvim.transparent_window = true
lvim.colorscheme = 'deus'
-- vim options
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.relativenumber = true


-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader                                              = "space"
-- add your own keymapping
lvim.keys.normal_mode["S"]                           = ":w<cr>"
lvim.keys.normal_mode["E"]                               = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["R"]                               = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["H"]                               = "^"
lvim.keys.normal_mode["L"]                               = "$"
lvim.keys.normal_mode["Q"]                               = ":q<cr>"
lvim.keys.normal_mode["<leader><cr>"]                       = ":nohl<cr>"
lvim.keys.normal_mode["<leader>j"]                       = ":ClangdSwitchSourceHeader<cr>"
lvim.keys.normal_mode["<leader>H"]                       = ":ClangdTypeHierarchy<cr>"
lvim.keys.normal_mode["<leader>o"]                       = ":Vista!!<cr>"
--lvim.keys.normal_mode["<leader>q"]                       = ":bd<cr>"
lvim.keys.normal_mode["q"]                               = "<Nop>"
lvim.keys.normal_mode["n"]                               = "nzzzv"
lvim.keys.normal_mode["N"]                               = "Nzzzv"

lvim.keys.normal_mode[";"]                               = ":"
lvim.keys.visual_mode[";"]                               = ":"

--split window
lvim.keys.normal_mode["sk"]                              = ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>"
lvim.keys.normal_mode["sj"]                              = ":set splitbelow<CR>:split<CR>"
lvim.keys.normal_mode["sh"]                              = ":set nosplitbelow<CR>:vsplit<CR>:set splitright<CR>"
lvim.keys.normal_mode["sl"]                              = ":set splitright<CR>:vsplit<CR>"
lvim.keys.normal_mode["tu"]                              = ":tabe<CR>"
lvim.keys.normal_mode["th"]                              = ":-tabnext<CR>"
lvim.keys.normal_mode["tl"]                              = ":+tabnext<CR>"

--text edit
--更改默认"K"的映射
lvim.lsp.buffer_mappings.normal_mode['K'] = {"15k"}
lvim.lsp.buffer_mappings.normal_mode['<leader>k'] = {vim.lsp.buf.hover, "show hover"}

lvim.keys.normal_mode["J"]                              = "15j"
--lvim.keys.normal_mode["K"]                              = "15k"
lvim.keys.visual_mode["J"]                              = "15j"
lvim.keys.visual_mode["K"]                              = "15k"
lvim.keys.normal_mode["<"]                              = "<<"
lvim.keys.normal_mode[">"]                              = ">>"


lvim.keys.visual_mode["p"]                               = "P"
lvim.keys.visual_mode["H"]                               = "^"
lvim.keys.visual_mode["L"]                               = "$"

-- undo tree
lvim.keys.normal_mode["<leader>u"]                       = ":UndotreeToggle<cr>"

-- 大文件读取优化
vim.cmd([[
augroup LargeFile
        let g:large_file = 3145728 " 3MB

        " Set options:
        "   eventignore+=FileType (no syntax highlighting etc
        "   assumes FileType always on)
        "   noswapfile (save copy of file)
        "   bufhidden=unload (save memory when other file is viewed)
        "   buftype=nowritefile (is read-only)
        "   undolevels=-1 (no undo possible)
        au BufReadPre *
                \ let f=expand("<afile>") |
                \ if getfsize(f) > g:large_file |
                        \ set eventignore+=FileType |
                        \ setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 filetype=off lazyredraw eventignore=all nohidden syntax=off
                \ else |
                        \ set eventignore-=FileType |
                \ endif
augroup END
]])

-- Additional Plugins
lvim.plugins = {
  {
    "mbbill/undotree",
    config = function()
    end
  },
  {
    "folke/todo-comments.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  },
  { -- auto save
    "pocco81/auto-save.nvim"
  },
  {
    -- theme
    "theniceboy/nvim-deus"
  },
  {
    -- 自动更改外部的更改
    "djoshea/vim-autoread"
  },
  {
    -- 自动匹配(),[],"",if else等,<ENTER>进入
    "gcmt/wildfire.vim"
  },
  {
    -- show color
    "norcalli/nvim-colorizer.lua"
  },
  {
    -- color theme
    "lunarvim/colorschemes"
  },
  {
    -- rainbow
    "rainbow-delimiters.nvim"
  },
  {
    -- 多光标操作crtl+n
    "mg979/vim-visual-multi"
  },
  {
    "L3MON4D3/LuaSnip"
  },
}

vim.cmd([[
  let g:undotree_WindowLayout = 2
]])

--[[ require("lspconfig").matlab_ls.setup({
    settings = {
	matlab = {
	    capabilities = require("cmp_nvim_lsp").default_capabilities(),
	    indexWorkspace = true,
	    installPath = "/Applications/MATLAB_R2023b.app",
	    telemetry = false,
	},
    },
    single_file_support = true,
}) ]]
