{ config, pkgs, ... }:

{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 42;
          margin-top = 5;
          margin-left = 8;
          margin-right = 8;
          output = [
            "eDP-1"
          ];
          modules-left = [
            "custom/launcher"
            "mpd"
            "custom/cava-internal"
            "hyprland/workspaces"
          ];
          modules-center = [ "hyprland/window" ];
          modules-right = [
            "network"
            "pulseaudio"
            "backlight"
            "temperature"
            "cpu"
            "memory"
            "battery"
            "clock"
            "tray"
            "custom/power"
          ];

          "custom/launcher" = {
            "format" = " ";
            "on-click" = "pkill rofi || rofi2";
            "on-click-middle" = "exec default_wall";
            "on-click-right" = "exec wallpaper_random";
            "tooltip" = false;
          };

          "custom/cava-internal" = {
            "exec" = "sleep 1s && cava-internal";
            "tooltip" = false;
          };

          "hyprland/window" = {
            "format" = " {} ";
            "rewrite" = {
              "(.*) — Mozilla Firefox" = " Firefox";
              "(.*) - kitty" = "󰞷";
            };
            "separate-outputs" = true;
            "max-length" = 25;
          };

          "pulseaudio" = {
            "scroll-step" = 1;
            "format" = "{icon}";
            "format-muted" = "󰖁 Muted";
            "format-icons" = {
              "default" = [ "" "" "" ];
            };
            "on-click" = "pamixer -t";
            "tooltip" = false;
            "reverse-scrolling" = true;
          };

          "clock" = {
            "interval" = 60;
            "format" = "{:%H:%M} ";
            "max-length" = 25;
            "tooltip-format" = "{:%A, %B %d, %Y (%R)} ";

          };
          "memory" = {
            "interval" = 1;
            "format" = "󰻠 {percentage}%";
            "states" = {
              "warning" = 85;
            };
          };

          "cpu" = {
            "interval" = 1;
            "format" = "󰍛 {usage}%";
          };

          "mpd" = {
            "max-length" = 25;
            "format" = "<span foreground='#bb9af7'></span> {title}";
            "format-paused" = " {title}";
            "format-stopped" = "<span foreground='#bb9af7'></span>";
            "format-disconnected" = "";
            "on-click" = "mpc --quiet toggle";
            "on-click-right" = "mpc update; mpc ls | mpc add";
            "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp ";
            "on-scroll-down" = "mpc --quiet prev";
            "on-scroll-up" = "mpc --quiet next";
            "smooth-scrolling-threshold" = 5;
            "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
          };

          "network" = {
            "format-disconnected" = "󰯡";
            "format-ethernet" = "󰒢";
            "format-linked" = "󰖪 {essid} (No IPi)";
            "format-wifi" = "󰖩";
            "interval" = 1;
            "tooltip" = true;
            "tooltip-format-wifi" = "{essid} ({signalStrength}%)  \n {ipaddr}";
            "tooltip-format-ethernet" = "{ifname} \n {ipaddr}";
            "tooltip-format-disconnected" = "Disconnected";
          };

          "custom/powermenu" = {
            "format" = "";
            "on-click" = "pkill rofi || ~/.config/rofi/powermenu/type-3/powermenu.sh";
            "tooltip" = false;
          };

          "tray" = {
            "icon-size" = 15;
            "spacing" = 5;
          };

          "backlight" = {
            "device" = "intel_backlight";
            "rotate" = 0;
            "format" = "{icon}";
            "format-icons" = [ "" "" "" "" "" "" "" "" "" ];
            "on-scroll-down" = "brightnessctl set 1%-";
            "on-scroll-up" = "brightnessctl set 1%+";
            "reverse-scrolling" = true;
          };

          "temperature" = {
            "thermal-zone" = 2;
            "hwmon-path" = "/sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/hwmon/hwmon0/temp1_input";
            "critical-threshold" = 80;
            "format-critical" = " {temperatureC}°C";
            "format" = " {temperatureC}°C";
          };

          "battery" = {
            "states" = {
              "good" = 95;
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "{icon} {capacity}%";
            "format-full" = "{icon} {capacity}%";
            "format-charging" = " {capacity}%";
            "format-plugged" = " {capacity}%";
            "format-icons" = [ "" "" "" "" "" ];
          };
        };
      };
      style = ''
        * {
                   font-family: "JetBrainsMono Nerd Font";
                   font-size: 12pt;
                   font-weight: bold;
                   border-radius: 8px;
                   transition-property: background-color;
                   transition-duration: 0.5s;
                 }
                 @keyframes blink_red {
                   to {
                     background-color: rgb(242, 143, 173);
                     color: rgb(26, 24, 38);
                   }
                 }
                 .warning, .critical, .urgent {
                   animation-name: blink_red;
                   animation-duration: 1s;
                   animation-timing-function: linear;
                   animation-iteration-count: infinite;
                   animation-direction: alternate;
                 }
                 window#waybar {
                   background-color: transparent;
                 }
                 window > box {
                   margin-left: 4px;
                   margin-right: 4px;
                   margin-top: 4px;
                   background-color: #1e1e2a;
                   padding: 3px;
                   padding-left:8px;
                   border: 2px none #33ccff;
                 }
           #workspaces {
                   padding-left: 0px;
                   padding-right: 4px;
                 }
           #workspaces button {
                   padding-top: 5px;
                   padding-bottom: 5px;
                   padding-left: 6px;
                   padding-right: 6px;
                 }
           #workspaces button.active {
                   background-color: rgb(181, 232, 224);
                   color: rgb(26, 24, 38);
                 }
           #workspaces button.urgent {
                   color: rgb(26, 24, 38);
                 }
           #workspaces button:hover {
                   background-color: rgb(248, 189, 150);
                   color: rgb(26, 24, 38);
                 }
                        #custom-cava-internal{
                       font-family: "Hack Nerd Font" ;
                       color: #33ccff;
                     }
      '';
    };
  };
}
