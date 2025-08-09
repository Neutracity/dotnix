{
  services.printing.enable = true;


  hardware.bluetooth.enable = true;
  hardware.bluetooth.powerOnBoot = true;
  services.blueman.enable = true;

  swapDevices = [{
    device = "/var/lib/swapfile";
    size = 8 * 1024;
  }];

  hardware.graphics.enable32Bit = true;
  # services.pulseaudio.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
