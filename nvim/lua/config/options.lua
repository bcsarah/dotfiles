vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 2

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.wrap = false
vim.opt.linebreak = false

vim.opt.undofile = true

vim.opt.background = "dark"

-- diagnostic
vim.diagnostic.config({
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})

-- markdown
vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(ev)
        vim.opt_local.wrap = true
        vim.opt_local.linebreak = true
        vim.opt_local.formatoptions:append("w")

        vim.keymap.set("n", "gx", function()
            local line = vim.api.nvim_get_current_line()
            local col = vim.api.nvim_win_get_cursor(0)[2] + 1

            for start, link, finish in line:gmatch("()%b[]%((.-)%)()") do
                if col >= start and col < finish then
                    if link:match("^https?://") then
                        vim.ui.open(link)
                    else
                        local path = vim.fn.fnamemodify(
                            vim.fn.expand("%:p:h") .. "/" .. link,
                            ":p"
                        )
                        vim.cmd.edit(vim.fn.fnameescape(path))
                    end
                    return
                end
            end

            vim.notify("Nenhum link encontrado", vim.log.levels.WARN)
        end, { buffer = ev.buf, desc = "Abrir link Markdown" })
    end,
})
