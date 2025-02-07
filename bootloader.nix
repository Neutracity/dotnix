{ pkgs, ... }:

{
  stylix.targets.plymouth.enable = false;
  stylix.targets.grub.enable = false;
  boot = {

    plymouth = {
      enable = true;
      theme = "mc";
      themePackages = [
        pkgs.plymouth-minecraft-theme
      ];

    };

    # Enable "Silent Boot"
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader = {
      timeout = 4;
      grub = {
        enable = true;
        useOSProber = true;
        efiSupport = true;
        efiInstallAsRemovable = true;
        device = "nodev";
        minegrub-theme = {
          enable = true;
          splash = "100% Flakes!";
          background = "background_options/1.8  - [Classic Minecraft].png";
          boot-options-count = 4;
        };
      };
    };
  };
}
