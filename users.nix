{ config, pkgs, inputs, ... }:
let 
username = config.var.username;
in {
  users.users.${username} = {
    isNormalUser = true;
    description = "${username} user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      kdePackages.kate
      thunderbird
    ];
  };
}
