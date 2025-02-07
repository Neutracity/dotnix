{
  wayland.windowManager.hyprland = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "nemo";
      "$menu" = "menu";
      "$browser" = "zen";

      bind = [
        "$mod, Z, exec, $browser"
        "$mod, Q, exec, kitty"
        "$mod, W, togglefloating"
        "$mod, C, killactive"
        "$mod, F, fullscreen"
        "Alt_L, F4, killactive"
        "$mod, R, exec, $menu"

        # My customs keybinds

        "$mod SHIFT, S, exec, swappyfile=$(hyprshot -o /home/neutra/media/pictures/screenshots -m region -- echo); swappy -f $swappyfile -o $swappyfile "
        "$mod SHIFT, P, exec, hyprpicker --autocopy"
        "$mod SHIFT, M, exec, pkill waybar || waybar "
        "$mod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mod SHIFT, O, exec, hyprlock"
        "$mod, BackSpace, exec, powermenu"
        "$mod, S, exec, moonlight stream DESKTOP-NALUKC5 Desktop"
        "$mod, E, exec, $fileManager"
        "$mod, Space, togglesplit"

        #windows management

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

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


        "$mod, J, togglesplit"
        # "$mod+SHIFT, E, exec, eaccentmenu"
        # ", e, exec, eaccentmenu, longpress, 500"
      ];

      unbind = [
        # Disable Arrow Keys
        ",Right"
        ",Left"
        ",Up"
        ",Down"
      ];


      bindo = [
        ",e, exec, eaccentmenu"
        ",a, exec, aaccentmenu"
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      binde = [
        "$mod+Shift, L, resizeactive, 30 0"
        "$mod+Shift, H, resizeactive, -30 0"
        "$mod+Shift, K, resizeactive, 0 -30"
        "$mod+Shift, J, resizeactive, 0 30"
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
}
