{ config , ...}:
{
  config.var = {
    hostname = "neunix";
    username = "neutra";
    configDirectory = "/home/" + config.var.username + "/.dotfiles/";
    theme = {
      rounding = 15;
      gaps-in = 5;
      gaps-out = 5 * 2;
      active-opacity = 1;
      inactive-opacity = 0.89;
      blur = true;
      border-size = 3;
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
