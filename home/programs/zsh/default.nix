{ config, pkgs, ... }:

{
  programs = {
    zsh = {
      enable = true;
      shellAliases = {
        ls = "${pkgs.eza}/bin/eza --icons=auto --header --group-directories-first";
        l = "${pkgs.eza}/bin/eza -lah --icons=auto --header --group-directories-first";
        ll = "${pkgs.eza}/bin/eza -l --icons=auto --header --group-directories-first";
        la = "${pkgs.eza}/bin/eza -a --icons=auto --header --group-directories-first";
        lt = "${pkgs.eza}/bin/eza --tree --icons=auto --header --group-directories-first";
        lla = "${pkgs.eza}/bin/eza -la --icons=auto --header --group-directories-first";
        ezsh = "nvim /home/neutra/.dotfiles/home/programs/zsh/default.nix";
        econfig = "nvim /home/neutra/.dotfiles/configuration.nix";
        eflake = "nvim /home/neutra/.dotfiles/flake.nix";
        nr = "sudo nixos-rebuild switch --flake /home/neutra/.dotfiles#default";
        nu = "sudo nixos-rebuild switch --upgrade-all";
        fu = "nix flake update -I /home/neutra/.dotfiles/flake.nix";
        hr = "home-manager switch --flake /home/neutra/.dotfiles";
        se = "sudoedit";
        ff = "fastfetch";
        neofetch = "fastfetch";
        ga = "git add -A";
        gc = "git commit -m";
        gp = "git push";
        gpt = "git push --follow-tags";
        gt = "git tag -ma";
        gs = "git status";
        gl = "git log";
      };

      initExtra =''
        prompt_dir() {
        prompt_segment blue $CURRENT_FG '%1~'
        }
      '';
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
          "kitty"
          "zoxide"
          "sudo"
          "thefuck"
        ];
      };

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
