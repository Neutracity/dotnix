{ pkgs, ... }:
{

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [
    "amd_pstate=guided"
    "amdgpu"
  ];
  hardware.graphics.extraPackages = with pkgs; [
    vaapiVdpau
    rocmPackages.clr
    rocmPackages.clr.icd
    amdvlk
  ];

  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];
  hardware.graphics.enable = true;
  environment.systemPackages = with pkgs; [
    mesa
    libglvnd
  ];
  environment.variables = {
    VDPAU_DRIVER = "radeonsi";
    LIBVA_DRIVER_NAME = "radeonsi";
    NIXOS_OZONE_WL = "1";
    EGL_PLATFORM = "wayland";
    GDK_BACKEND = "wayland";
  };
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
