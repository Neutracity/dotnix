{ config
, pkgs
, ...
}:
let
  border-size = config.var.theme.border-size;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
  active-opacity = config.var.theme.active-opacity;
  inactive-opacity = config.var.theme.inactive-opacity;
  rounding = config.var.theme.rounding;
  blur = config.var.theme.blur;
  keyboardLayout = config.var.keyboardLayout;
in
{
  home.packages = with pkgs; [
    hyprpicker
    hyprcursor
    hypridle
    mpv
    imv
    qt5.qtwayland
    qt6.qtwayland
    libsForQt5.qt5ct
    qt6ct
    hyprshot
    swappy
    wf-recorder
    wlr-randr
    wl-clipboard
    brightnessctl
    gnome-themes-extra
    libva
    dconf
    nemo-with-extensions
    wayland-utils
    wayland-protocols
    direnv
    meson
    swaylock-effects
    cliphist
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      monitor = [
        "eDP-1, 1920x1080@60.04Hz, auto, 1"
        # "HDMI-A-1, 1920x1080@60.00Hz, -1920x0, 1"
        "desc:Samsung Electric Company U28E590 HNMNC10967, 3840x2160@60Hz, -2887x0, 1.33 "
        # "HDMI-A-1, prefered, -3072x0, 1.25"
        ", preferred, auto, 1.25, mirror, eDP-1"
      ];

      general = {
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        allow_tearing = true;
        resize_on_border = true;
      };

      decoration = {
        rounding = rounding;
        active_opacity = 0.95;
        inactive_opacity = 0.80 ;
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };

        shadow = {
          enabled = true;
          # color = "rgba(00000055)";
          ignore_window = true;
          offset = "0 15";
          range = 100;
          render_power = 2;
          scale = 0.97;
        };
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };


      input = {
        kb_layout = keyboardLayout;
        follow_mouse = 1;
        touchpad.natural_scroll = "yes";
        numlock_by_default = true;
        force_no_accel = 1;
        sensitivity = 0;
      };
      dwindle = {
        # keep floating dimentions while tiling
        pseudotile = true;
        preserve_split = true;
      };

      workspace = [
        "1,name:PrimaryScreen, monitor:eDP-1"
        "2,name:SecondScreen, monitor:desc:Samsung Electric Company U28E590 HNMNC10967,gapsout:30"
      ];

      windowrulev2 = [
        "size 50% 50%,floating:1"
        "center, floating:1"
        "float,class:mpv"
        "center,class:mpv"
        "size 50% 50%, class:mpv"

        "float, title:^(Picture-in-Picture)$"
        "pin, title:^(Picture-in-Picture)$"

        "float, title:^(.*Bitwarden Password Manager.*)$"
        "workspace 0 silent, title:^(Spotify( Premium)?)$"
      ];

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
      };

      misc = {
        vrr = 0;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        force_default_wallpaper = 0;
      };

      xwayland = {
        force_zero_scaling = true;
      };


      exec-once = [
        "waybar"
        "uwsm finalize"
        "hypridle"
        "dunst -conf .config/dunst/dunstrc"
        "hyprpaper"
        "wl-paste --watch cliphist store"
      ];

      env = [
        "GDK_SCALE, 1"
        "XCURSOR_SIZE, 32"
        "PATH,$PATH:$scrPath"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "MOZ_ENABLE_WAYLAND,1"
        "GDK_SCALE,1"
      ];
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
}
