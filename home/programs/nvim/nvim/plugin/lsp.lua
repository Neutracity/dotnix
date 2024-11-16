require('neodev').setup()
require'lspconfig'.lua_ls.setup{}
require("lspconfig").nixd.setup({
  cmd = { "nixd" },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
            expr = '(builtins.getFlake "/home/neutra/.dotfiles/flake.nix").nixosConfigurations.CONFIGNAME.options',
        },
        home_manager = {
            expr = '(builtins.getFlake "/home/neutra/.dotfiles/flakes.nix").homeConfigurations.CONFIGNAME.options',
        },
      },
    },
  },
})



