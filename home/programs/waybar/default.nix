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
          height = 38 ;
          margin-top = 8;
          margin-left = 5;
          margin-right = 5;
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

          "pulseaudio" = {
            "scroll-step" = 2;
            "format" = "{icon}";
            "format-muted" = "󰖁";
            "format-bluetooth" = "{icon}  {format_source}";
            "format-bluetooth-muted" = "󰖁 ";
            "format-icons" = {
              "headphone"= "";
              "hands-free"= "";
              "headset"= "";
              "phone"= "";
              "portable"= "";
              "car"= "";
              "default" = ["" "" ""];
            };
            "on-click" = "pavucontrol";
            "tooltip" = false;
            "reverse-scrolling" = true;
          };

          "clock" = {
            "interval" = 60;
            "format" = "{:%H:%M} ";
            "max-length" = 25;
            "tooltip-format" = "{:%A, %B %d, %Y (%R)} ";
            "on-click"= "gnome-calendar";
          };
          "memory" = {
            "interval" = 1;
            "format" = "󰻠";
            "states" = {
              "warning" = 85;
            };
            "on-click"= "kitty -e 'btop'";
          };

          "cpu" = {
            "interval" = 1;
            "format" = "󰍛";
            "on-click"= "kitty -e 'btop'";
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
            "on-click"= "kitty -e 'nmtui'";
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
            "critical-threshold" = 70;
            "format-critical" = "";
            "format" = "{icon}";
            "format-icons" = ["" "" "" "" "" "" "" ""];
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
          border-radius: 8px;
          border : none;
        }
        #custom-cava-internal{
          font-family: "Hack Nerd Font" ;
        }

        window#waybar {
          background: rgba(0, 0, 0, 0);
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network,
        #pulseaudio,
        #custom-media,
        #tray,
        #backlight,
        #mode,
        #custom-power,
        #custom-menu,
        #custom-cava-internal,
        #custom-launcher,
        #idle_inhibitor {
            padding: 0 10px;
        }
        /*-----module groups----*/
        .modules-right {
            margin: 2px 10px 0 0;
            background-color: #${config.lib.stylix.colors.base00};
        }
        .modules-center {
            margin: 2px 0 0 0;
           /*background-color: #${config.lib.stylix.colors.base00};*/
        }
        .modules-left {
            margin: 2px 0 0 5px;
            background-color: #${config.lib.stylix.colors.base00};
        }
        #workspaces button {
            padding: 1px 4px;
            background-color: transparent;
        }

        #battery.warning:not(.charging) {
	      color: #${config.lib.stylix.colors.base0A};
        }
        #battery.critical:not(.charging) {
            color: #${config.lib.stylix.colors.base09};
        }
        #temperature.critical {
            color: #${config.lib.stylix.colors.base09};
        }

        #pulseaudio.muted {
            color: #${config.lib.stylix.colors.base09};
        }

      '';
    };
  };
}
