{
  config,
  pkgs,
  ...
}: {
  programs.starship = {
      enable = false;
      settings = {
        add_newline = true;
        command_timeout = 1300;
        scan_timeout = 50;
        format= "$all$nix_shell$nodejs$lua$golang$rust$php$git_branch$git_commit$git_state$git_status\n$username$hostname$directory";
        character = {
          success_symbol = "[](bold green) ";
          error_symbol = "[✗](bold red) ";
        };
      };
  };
  programs.oh-my-posh ={
    enable = true;
    enableZshIntegration = true;
    useTheme = "atomic";
    # settings = builtins.fromJSON (builtins.unsafeDiscardStringContext (builtins.readFile ./customtheme.omp.json));
  };
  home.packages = with pkgs; [ pokemon-colorscripts-mac];
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
        uzsh = "source /home/neutra/.zshrc";
        econfig = "nvim /home/neutra/.dotfiles/configuration.nix";
        eflake = "nvim /home/neutra/.dotfiles/flake.nix";
        nr = "sudo nixos-rebuild switch --flake /home/neutra/.dotfiles#default";
        nu = "sudo nixos-rebuild switch --upgrade-all /home/neutra/.dotfiles";
        fu = "nix flake update -I /home/neutra/.dotfiles/flake.nix";
        hr = "home-manager switch --flake /home/neutra/.dotfiles";
        se = "sudoedit";
        ff = "fastfetch";
        neofetch = "fastfetch";
        nmtui = "better-nmtui";
        ga = "git add -A";
        gc = "git commit -m";
        gp = "git push";
        gpt = "git push --follow-tags";
        gt = "git tag -ma";
        gs = "git status";
        gl = "git log";
        cd = "z";
      };
      
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = [
          "git"
          "aliases"
          "ssh"
          "kitty"
          "zoxide"
          "fzf"
          "sudo"
          "thefuck"
        ];
      };
      initExtra = ''
        pokemon-colorscripts -r | tail -n +3 
      '';

    };
  };
}
