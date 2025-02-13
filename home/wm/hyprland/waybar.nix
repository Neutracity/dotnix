{ config
, pkgs
, ...
}:
let
  border-size = config.var.theme.border-size;
  gaps-in = config.var.theme.gaps-in;
  gaps-out = config.var.theme.gaps-out;
  rounding = config.var.theme.rounding;
in
{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 32;
          margin-top = gaps-out;
          margin-left = gaps-out;
          margin-right = gaps-out;
          output = [
            "eDP-1"
          ];

          modules-left = [
            "custom/launcher"
            "hyprland/workspaces"
          ];

          modules-center = [
            "custom/cava-internal"
          ];

          modules-right = [
            "group/devices"
            "group/hardware"
            "group/time"
            "tray"
            "custom/power"
          ];

          "group/hardware" = {
            "orientation" = "horizontal";
            "modules" = [ "cpu" "memory" "temperature" ];
          };

          "group/devices" = {
            "orientation" = "horizontal";
            "modules" = [ "network" "pulseaudio" "backlight" ];
          };

          "group/time" = {
            "orientation" = "horizontal";
            "modules" = [ "battery" "clock" "idle_inhibitor"];
          };

          "hyprland/workspaces" = {
            "format" = "";
            "format-window-separator" = "";
          };

          "idle_inhibitor"= {
            "format"= "{icon}";
            "format-icons"= {
                "activated"= "";
                "deactivated"= "";
            };
          };

          "custom/launcher" = {
            "format" = "";
            "icon-size" = 15;
            "on-click" = "exec menu";
            "on-click-middle" = "exec powermenu";
            "on-click-right" = "exec wallpaper_random";
            "tooltip" = false;
          };

          "custom/cava-internal" = {
            "exec" = "sleep 1s && cava-internal";
            "tooltip" = false;
            "on-click" = "kitty -e 'cava'";
          };

          "pulseaudio" = {
            "scroll-step" = 2;
            "format" = "{icon}";
            "format-muted" = "󰖁";
            "format-bluetooth" = "{icon}  {format_source}";
            "format-bluetooth-muted" = "󰖁 ";
            "format-icons" = {
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "portable" = "";
              "car" = "";
              "default" = [ "" "" "" ];
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
            "on-click" = "gnome-calendar";
          };
          "memory" = {
            "interval" = 1;
            "format" = "󰻠";
            "states" = {
              "warning" = 85;
            };
            "on-click" = "kitty -e 'btop'";
          };

          "cpu" = {
            "interval" = 1;
            "format" = "󰍛";
            "on-click" = "kitty -e 'btop'";
          };

          "network" = {
            "format-discnnected" = "󰯡";
            "format-ethernet" = "󰒢";
            "format-linked" = "󰖪 {essid} (No IPi)";
            "format-wifi" = "󰖩";
            "interval" = 1;
            "tooltip" = true;
            "tooltip-format-wifi" = "{essid} ({signalStrength}%)  \n {ipaddr}";
            "tooltip-format-ethernet" = "{ifname} \n {ipaddr}";
            "tooltip-format-disconnected" = "Disconnected";
            "on-click" = "kitty -e 'better-nmtui'";
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
            "critical-threshold" = 70;
            "format-critical" = "";
            "format" = "{icon}";
            "format-icons" = [ "" "" "" "" "" "" "" "" ];
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
            "format-icons" = [ "" "" "" "" "" ];
            "tooltip-format" = "{capacity} %";
          };
        };
      };
      style = ''
                *{
                  border-radius: ${toString (rounding+2)} ;
                  border : ${toString border-size};
                }
                #custom-cava-internal{
                  font-family: "Hack" ;
                }

                window#waybar {
                  background: white;
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
                #hyprland-workspaces,
                #backlight,
                #mode,
                #custom-power,
                #custom-launcher,
                #idle_inhibitor {
                    padding: 0 10px;
                    font-size: 16px;
                }
        
                #custom-menu{
                    font-size: 20px;
                    padding: 0 10px;
                }
                /*-----module groups----*/


                .modules-right {
                    background-color: transparent; 
                }

                .modules-center {
                    margin: 0 0 0 0;
                    background-color: #${config.lib.stylix.colors.base00};
                    opacity: 0.8;
                }

                .modules-left {
                    margin: 0 0 0 0;
                    background-color: #${config.lib.stylix.colors.base00};
                    opacity: 0.8;
                }
        
                #custom-cava-internal{
                    background-color: #${config.lib.stylix.colors.base00};
                    padding: 0px 10px;
                    opacity: 0.8; 
                    font-size: 16px;
                }

                #workspaces {
                    margin: 5px 5px 5px 5px;
                    padding: 0px 0px;
                    background-color: #${config.lib.stylix.colors.base00};
                    color: #${config.lib.stylix.colors.base00};
                    transition: all 0.3s ease-in-out;
                    opacity: 0.8;
                }
          
                #workspaces button {
                    padding: 0px 6px;
                    margin: 0px 4px;
                    background-color: #${config.lib.stylix.colors.base01};
                    color: #${config.lib.stylix.colors.base01};
                    transition: all 0.3s ease-in-out;
                    opacity: 0.4;
                    font-size: 13px;
                }
        
                #workspaces button.active {
                    min-width:40px;
                    background-size: 100% 400%;
                    background-color: #${config.lib.stylix.colors.base05};
                    color: #${config.lib.stylix.colors.base05};
                    transition: all 0.3s ease-in-out;
                    opacity: 1.0;
                }
        
                #hardware {
                    background-color: #${config.lib.stylix.colors.base00};
                    opacity: 0.8;
                    margin: 0px 0px 0px 10px;
                    padding: 0px 3px;
                }

                #devices {
                    background-color: #${config.lib.stylix.colors.base00};
                    opacity: 0.8;
                    margin: 0px 0px 0px 10px;
                    padding: 0px 3px;
                }

                #time {
                    background-color: #${config.lib.stylix.colors.base00};
                    opacity: 0.8;
                    margin: 0px 0px 0px 10px;
                    padding: 0px 6px 0px 3px;
                }

                #tray {
                    background-color: #${config.lib.stylix.colors.base00}; 
                    opacity: 0.8;
                    margin: 0px 0px 0px 10px;
                    padding: 0px 10px;
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
