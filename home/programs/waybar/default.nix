{
  config,
  pkgs,
  ...
}: {
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 42 ;
          margin-top = 5;
          margin-left = 8;
          margin-right = 8;
          output = [
            "eDP-1"
          ];
         modules-left = [
            "custom/launcher"
            "custom/cava-internal"
            "hyprland/workspaces"
          ];
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
            "format-muted" = "󰖁";
            "format-icons" = {
              "default" = ["" "" ""];
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
            "format-icons" = ["" "" "" "" "" "" "" "" ""];
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
            "format" = "{icon}";
            "format-full" = "{icon}";
            "format-charging" = "󱐋{icon}";
            "format-plugged" = "{icon}";
            "format-icons" = ["" "" "" "" ""];
            "tooltip-format" = "{capacity} %";
          };
        };
      };  
      style = ''
        *{

        }
        #custom-cava-internal{
          font-family: "Hack Nerd Font" ;
          color: #33ccff;
        }

      '';
    };
  };
}
