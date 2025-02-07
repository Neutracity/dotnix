{ pkgs, ... }:

let
  eaccentmenu = pkgs.writeShellScriptBin "eaccentmenu"
    ''
      if pgrep wofi; then
      	pkill wofi
      else
        accents=("é" "è" "ê" "ë" "É" "È" "Ê" "Ë")
                selected=$(printf '%s\n' "''${accents[@]}" | wofi -p " Quickmenu" --dmenu)

      if [ -n "''$selected" ]; then
        wtype $selected
        fi
      fi
    '';

  aaccentmenu = pkgs.writeShellScriptBin "aaccentmenu"
    ''
      if pgrep wofi; then
      	pkill wofi
      else
        accents=("á" "à" "â" "ä" "A" "Á" "À" "Â" "Ä")
                selected=$(printf '%s\n' "''${accents[@]}" | wofi -p " Quickmenu" --dmenu)

      if [ -n "''$selected" ]; then
        wtype $selected
        fi
      fi
    '';
in
{ home.packages = [ aaccentmenu eaccentmenu pkgs.wtype ]; }
