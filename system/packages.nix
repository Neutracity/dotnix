{ pkgs, inputs, ... }:
{
environment.systemPackages = with pkgs; [
    (inputs.godot-bin.packages.x86_64-linux.godot-mono.override { msbuild = pkgs.bash; })
    weylus
    dotnet-sdk_7
    playerctl
    osu-lazer
    gnome-calendar
    moonlight-qt
    pavucontrol
    steam
    git
    gnome-bluetooth
    pavucontrol
    mesa
    thefuck
    gimp
    python3
    vesktop
    brightnessctl
    mpd
    home-manager
    nixd
    nil
    libsForQt5.qt5.qtgraphicaleffects
    appimage-run
    git-lfs
    alejandra

    jetbrains.rider
    msbuild
    mono
    
    
    # (callPackage ./clife.nix { })
    (callPackage ./sddm-theme-wimst.nix { })
    # (callPackage ./cura.nix {})
  ];

  #FONTS
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
