vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop =4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 6
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.winborder = "double"

vim.opt.updatetime = 50
vim.opt.fileencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.mouse = ""

vim.g.netrw_liststyle = 0
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- MAPPINGS
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>o", ":update<CR>:source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>p", "pgvy")

vim.keymap.set("n", "gd", "<C-]>")
vim.keymap.set("n", "gad", "g<C-]>")

-- PLUGINS
require('packer').startup(function(use)
    use("wbthomason/packer.nvim")
    use("tpope/vim-fugitive")
    use("stevearc/oil.nvim")
    use({ 'everviolet/nvim', as = 'evergarden' })
    use('nvim-mini/mini.hipatterns')
end)

-- PICK
require("mini.pick").setup({})
vim.keymap.set("n", "<leader>f", ":Pick files<CR>")
vim.keymap.set("n", "<leader>h", ":Pick help<CR>")

-- FUGITIVE
vim.keymap.set("n", "<leader>g", vim.cmd.Git)

-- OIL
require("oil").setup({
    view_options = {
        show_hidden = true,
    }
})
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>s", ":e #<CR>")

-- COLORS
local hipatterns = require('mini.hipatterns')
hipatterns.setup {
    highlighters = {
        fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
        todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
        note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },

        hex_color = hipatterns.gen_highlighter.hex_color(),
    },
}

require('evergarden').setup {
    theme = {
        variant = 'winter', -- winter|fall|spring|summer
        accent = 'green',
    },
    editor = {
        transparent_background = false,
    },
}
vim.cmd("colorscheme evergarden")

vim.lsp.enable("pyright")

vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
    vim.diagnostic.open_float(nil, { focusable = false })
end
})
