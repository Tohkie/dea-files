{ pkgs, ... }:

let
  candyland-nvim = pkgs.vimUtils.buildVimPlugin {
    pname = "candyland-nvim";
    version = "1.0";
    src = pkgs.fetchFromGitHub {
      owner = "AmberLehmann";
      repo = "candyland.nvim";
      rev = "neovim-colorscheme";
      hash = "sha256-KEHMnpyJOhdF8ZPWuKF3uP7UX5fnzE31LMe+XxHK+i8=";
    };
  };
in
{
  programs.nvf = {
    enable = true;

    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings = {
      vim.viAlias = false;
      vim.vimAlias = true;
      vim.lsp = {
        enable = true;
      };
      vim.lazy.plugins.candyland-nvim = {
        package = candyland-nvim;
        colorscheme = "candyland-nvim";
      };
      vim.theme = {
        enable = false;
      };
    };
  };
}
