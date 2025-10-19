return {
    cmd = { "pyright-langserver", "--stdio" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
            }
        }
    },
    on_attach = function(client, bufnr)

    local opts = {buffer = bufnr, noremap = true, silent = true}
    vim.keymap.set('i', '<C-Space>', vim.lsp.buf.completion, opts)

    end


}
