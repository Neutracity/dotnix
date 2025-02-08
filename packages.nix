{ pkgs, inputs, ... }:
{
environment.systemPackages = with pkgs; [
    (inputs.godot-bin.packages.x86_64-linux.godot-mono.override { msbuild = pkgs.bash; })
    inputs.zen-browser.packages."${system}".default
    weylus
    dotnet-sdk_7
    playerctl
    osu-lazer
    bluetui
    gnome-calendar
    vim
    rar
    unrar
    unzip
    moonlight-qt
    wget
    unzip
    pavucontrol
    steam
    git
    tree
    clinfo
    btop
    gnome-bluetooth
    pavucontrol
    mesa
    fzf
    # blender
    thefuck
    gimp
    python3
    vesktop
    brightnessctl
    cava
    zoxide
    killall
    mpd
    home-manager
    nixd
    nil
    btop
    ripgrep
    libsForQt5.qt5.qtgraphicaleffects
    appimage-run
    git-lfs
    alejandra

    # jetbrains.rider
    # dotnet-sdk_6
    # msbuild
    # mono
    
    
    (callPackage ./clife.nix { })
    (callPackage ./sddm-theme-wimst.nix { })
    # (callPackage ./cura.nix {})
  ];

  #FONTS
  fonts.packages = with pkgs.nerd-fonts; [
    hack
    fira-mono
    fantasque-sans-mono
    jetbrains-mono
  ];

  virtualisation.docker.enable = true;

  #MODULES
  programs.kdeconnect.enable = true;
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "/home/neutra/.dotfiles/";
  };
  services.solaar = {
    enable = false; # Enable the service
    package = pkgs.solaar; # The package to use
    window = "hide"; # Show the window on startup (show, *hide*, only [window only])
    batteryIcons = "regular"; # Which battery icons to use (*regular*, symbolic, solaar)
    extraArgs = ""; # Extra arguments to pass to solaar on startup
  };
  services.printing.enable = true;
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;

  };
  services.keyd = {
    enable = true;
    keyboards = {
      default = {
        ids = [ "*" ];
        settings = {
          # The main layer, if you choose to declare it in Nix
          main = {
            capslock = "overload(control, esc)";
            esc = "layer(arrow)";
            left = "noop";
            right = "noop";
            down = "noop";
            up = "noop";
          };
          arrow = {
            h = "left";
            k = "up";
            j = "down";
            l = "right";
          };
        };
        extraConfig = ''
          # put here any extra-config, e.g. you can copy/paste here directly a configuration, just remove the ids part
        '';
      };
    };
  };
  programs.nix-ld.enable = true;
  services.udisks2.enable = true;


}
