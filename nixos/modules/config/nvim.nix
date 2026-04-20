{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withNodeJs = true;
    withPython3 = true;
    withRuby = true;

    initLua = ''
      require("config.lazy")
      vim.opt.clipboard = "unnamedplus"
      
      vim.opt.expandtab = true
      vim.opt.tabstop = 4
      vim.opt.softtabstop = 4
      vim.opt.shiftwidth = 4

      vim.opt.wrap = true
      vim.opt.breakindent = true
    '';
  };

  home.file.".config/nvim/lua/plugins/colorscheme.lua".text = ''
    return {
      {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
          vim.cmd.colorscheme("gruvbox")
        end,
      },
    }
  '';

  home.file.".config/nvim/lua/config/lazy.lua".text = ''
    local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
      })
    end

    vim.opt.rtp:prepend(lazypath)

    require("lazy").setup({
      { "LazyVim/LazyVim", import = "lazyvim.plugins" },
      { import = "plugins" },
    })
  '';
}
