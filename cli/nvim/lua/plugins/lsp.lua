-- lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      clangd = {
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        -- outras opções do clangd aqui
      },
    },
  },
}
