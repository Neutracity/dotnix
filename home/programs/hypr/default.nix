{
  config,
  pkgs,
  ...
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
in {
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
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      "$menu" = "menu";
    
      monitor = [
        "eDP-1, 1920x1080@60.04Hz, auto, 1.25"
        "HDMI-A-1, 1920x1080@60.00Hz, -1920x0, 1"
      ];

      general = {
        gaps_in = gaps-in;
        gaps_out = gaps-out;
        border_size = border-size;
        resize_on_border = true;
      };

      decoration = {
        rounding = rounding;
        #active_opacity = 1.0;
        #inactive_opacity = 0.95 ;
        blur = {
          enabled = blur;
          size = 10;
          vibrancy = 0.1696;
        };
      };

      input = {
        kb_layout = keyboardLayout;
        follow_mouse = 1;
        touchpad.natural_scroll = "yes";
        numlock_by_default = true;
        force_no_accel = 1;
        sensitivity = 0;
      };

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

      bind = [
        "$mod, F, exec, firefox"
        "$mod, Q, exec, kitty"
        "$mod, W, togglefloating"
        "$mod, C, killactive"
        "Alt_L, F4, killactive"
        "$mod, R, exec, $menu"

        # My customs keybinds

        "$mod SHIFT, S, exec, hyprshot -m region -s -o /home/neutra/Pictures/screenshots"
        "$mod SHIFT, M, exec, pkill waybar || waybar "
        "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mod SHIFT, L, exec, swaylock"
        "$mod, BackSpace, exec, powermenu"

        #windows management

        # Move focus with mainMod + arrow keys
        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Switch workspaces with mainMod + [0-9]"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        # Example special workspace (scratchpad)
        "$mod, g, togglespecialworkspace, magic"
        "$mod SHIFT, g, movetoworkspace, special:magic"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        "$mod+Ctrl, Right, workspace, r+1"
        "$mod+Ctrl, Left, workspace, r-1"
        "$mod+Ctrl, l, workspace, r+1"
        "$mod+Ctrl, h, workspace, r-1"

        "Alt, Tab, movefocus, d"

        #"$mod, J, togglesplit"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binde = [
        "$mod+Shift, Right, resizeactive, 30 0"
        "$mod+Shift, Left, resizeactive, -30 0"
        "$mod+Shift, Up, resizeactive, 0 -30"
        "$mod+Shift, Down, resizeactive, 0 30"
      ];

      bindel = [
        ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
        ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        ",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
        ",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
      ];

      bindl = [
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
      ];
    };
  };
  systemd.user.targets.hyprland-session.Unit.Wants = ["xdg-desktop-autostart.target"];
}
