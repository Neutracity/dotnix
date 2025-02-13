pkgs: with pkgs.lib; {

  createHex = name: config: {
    option."${name}".enable = mkOption {
      description = " ~ Because Hexagons are Bestagons ~ \n Enabling `${name}` Hex";
      type = types.bool;
    };
    config = mkIf true config;
  };
}
