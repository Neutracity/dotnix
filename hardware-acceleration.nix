{ config, pkgs, inputs, ... }:
{

  boot.initrd.kernelModules = [ "amdgpu" ];
  boot.kernelParams = [

    # AMD CPU scaling
    # https://www.kernel.org/doc/html/latest/admin-guide/pm/amd-pstate.html
    # https://wiki.archlinux.org/title/CPU_frequency_scaling#amd_pstate
    # On recent AMD CPUs this can be more energy efficient.
    "amd_pstate=guided"

    # Load amdgpu at stage 1
    "amdgpu"
  ];

  # AMD GPU
  hardware.graphics.extraPackages = with pkgs; [
    # VA-API and VDPAU
    vaapiVdpau

    # AMD ROCm OpenCL runtime
    rocmPackages.clr
    rocmPackages.clr.icd

    # AMDVLK drivers can be used in addition to the Mesa RADV drivers.
    #amdvlk
  ];
  hardware.graphics.extraPackages32 = with pkgs; [
    driversi686Linux.amdvlk
  ];

  environment.variables = {
    # VAAPI and VDPAU config for accelerated video.
    # See https://wiki.archlinux.org/index.php/Hardware_video_acceleration
    "VDPAU_DRIVER" = "radeonsi";
    "LIBVA_DRIVER_NAME" = "radeonsi";
  };
  # Most software has the HIP libraries hard-coded. Workaround:
  systemd.tmpfiles.rules = [
    "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  ];
}
