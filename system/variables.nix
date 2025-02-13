{ config, ... }:
{
  imports = [ ./config-var.nix ];
  config.var = {
    hostname = "neunix";
    username = "neutra";
    ronfigDirectory = "/home/" + config.var.username + "/.dotfiles/";
    keyboardLayout = "us";

    theme = {
      rounding = 16;
      gaps-in = 5;
      gaps-out = 5 * 2;
      active-opacity = 1;
      inactive-opacity = 0.89;
      blur = true;
      border-size = 0;
      animation-speed = "medium"; # "fast" | "medium" | "slow"
      fetch = "fastfetch"; # "nerdfetch" | "neofetch" | "pfetch" | "none"

      bar = {
        position = "top"; # "top" | "bottom"
        transparent = true;
        transparentButtons = false;
        floating = true;
      };

    };

  };
}
