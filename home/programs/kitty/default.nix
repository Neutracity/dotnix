{ config, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    #font.package = pkgs.Hack ;
    #font.name = "Hack" ;
    #font.name = "jetbrains mono nerd font" ;
    settings = {
      confirm_os_window_close= -1;
      allow_remote_control = true;
      close_on_child_death = true;
      cursor_shape = "beam";
      enable_audio_bell = false;
      shell = "zsh";
      background_opacity = 0;
    };
    shellIntegration.enableZshIntegration = true;

  };
}
