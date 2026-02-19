{
  config,
  lib,
  inputs,
  pkgs,
  ...
}:

let
  utils = inputs.nixcats.utils;
in
{
  imports = [
    inputs.nixcats.homeModule
  ];

  config = {
    # this value, nixCats is the defaultPackageName you pass to mkNixosModules
    # it will be the namespace for your options.
    nixCats = {
      enable = true;
      nixpkgs_version = inputs.nixpkgs;
      # this will add the overlays from ./overlays and also,
      # add any plugins in inputs named "plugins-pluginName" to pkgs.neovimPlugins
      # It will not apply to overall system, just nixCats.
      addOverlays = # (import ./overlays inputs) ++
        [
          (utils.standardPluginOverlay inputs)
        ];
      # see the packageDefinitions below.
      # This says which of those to install.
      packageNames = [ "deavim" ];

      luaPath = "${./.}";

      # the .replace vs .merge options are for modules based on existing configurations,
      # they refer to how multiple categoryDefinitions get merged together by the module.
      # for useage of this section, refer to :h nixCats.flake.outputs.categories
      categoryDefinitions.replace = (
        {
          pkgs,
          settings,
          categories,
          extra,
          name,
          mkNvimPlugin,
          ...
        }@packageDef:
        {
          lspsAndRuntimeDeps = {
            general = with pkgs; [
              ripgrep
              fd
            ];
            treesitter = with pkgs; [
              tree-sitter
            ];
            lang = with pkgs; {
              lua = [
                lua-language-server
              ];
              nix = [
                nil
                nix-doc
              ];
              rust = with pkgs; [
                cargo
                rust-analyzer
              ];
              haskell = with pkgs; [
                haskell-language-server
                ormolu
              ];
            };
          };

          startupPlugins = {
            general = with pkgs.vimPlugins; [
              lze
              plenary-nvim
              nvim-notify
              nvim-web-devicons
              base16-nvim
              mini-nvim

              (pkgs.vimUtils.buildVimPlugin {
                pname = "candyland-nvim";
                version = "1.0";
                src = pkgs.fetchFromGitHub {
                  owner = "AmberLehmann";
                  repo = "candyland.nvim";
                  rev = "neovim-colorscheme";
                  hash = "sha256-KEHMnpyJOhdF8ZPWuKF3uP7UX5fnzE31LMe+XxHK+i8=";
                };
              })
            ];
            treesitter = with pkgs.vimPlugins; [
              nvim-treesitter-textobjects
              nvim-treesitter.withAllGrammars
            ];
          };
          optionalPlugins = {
            general = with pkgs.vimPlugins; [
            ];
            ui = with pkgs.vimPlugins; [
              dressing-nvim
            ];
            qol = with pkgs.vimPlugins; [
              undotree
              mini-hipatterns
            ];
            telescope = with pkgs.vimPlugins; [
              telescope-nvim
              telescope-fzf-native-nvim
              telescope-ui-select-nvim
            ];
            fyler = with pkgs.vimPlugins; [
              fyler-nvim
            ];
            lsp = with pkgs.vimPlugins; [
              nvim-lspconfig
            ];
            completion = with pkgs.vimPlugins; [
              blink-cmp
              nvim-cmp
              luasnip
              friendly-snippets
              cmp_luasnip
              cmp-buffer
              cmp-path
              cmp-nvim-lua
              cmp-nvim-lsp
              cmp-cmdline
              cmp-nvim-lsp-signature-help
              cmp-cmdline-history
              lspkind-nvim
            ];
            lang = with pkgs.vimPlugins; {
            };
          };

          # shared libraries to be added to LD_LIBRARY_PATH
          # variable available to nvim runtime
          sharedLibraries = {
            general = with pkgs; [
              # libgit2
            ];
          };
          environmentVariables = {
            lang = {
              rust = {
                # it literally won't see the rust-analyzer provided to it
                # if you don't use an envrionment variable to tell it
                RUST_ANALYZER_CMD = "${pkgs.rust-analyzer}/bin/rust-analyzer";
              };
            };
          };
        }
      );

      # see :help nixCats.flake.outputs.packageDefinitions
      packageDefinitions.replace = {
        # these are the names of your packages
        # you can include as many as you wish.
        deavim =
          { pkgs, ... }:
          {
            # they contain a settings set defined above
            # see :help nixCats.flake.outputs.settings
            settings = {
              wrapRc = true;
              # IMPORTANT:
              # your alias may not conflict with your other packages.
              aliases = [
                "dvim"
              ];
            };
            # and a set of categories that you want
            # (and other information to pass to lua)
            categories = {
              general = true;

              ui = true;
              qol = true;
              telescope = true;
              fyler = true;
              lsp = true;
              completion = true;
              treesitter = true;

              lang = {
                lua = true;
                nix = true;
                rust = true;
                haskell = true;
              };
            };
          };
      };
    };
  };
}
