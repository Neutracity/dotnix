{ pkgs, ... }:

let
  powermenu = pkgs.writeShellScriptBin "eaccentmenu"
    # bash
    ''
      if pgrep wofi; then
      	pkill wofi
      else
        accents=("e" "é" "è" "ê" "ë" "É" "È" "Ê" "Ë")

        selected=$(printf '%s\n' "''${accents[@]}" | wofi -p " Powermenu" --dmenu)
        selected=''${selected:2}
        if [ -n "$selected" ]; then
          xdotool keydown --name root "$selected"
          xdotool keyup --name root "$selected"
        fi
      fi
    '';
in { home.packages = [ eaccent ]; }
