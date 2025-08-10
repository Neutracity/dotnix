{ config
, inputs
, pkgs
, ...
}: {
  services.dunst = {
    enable = false;
  };
}
