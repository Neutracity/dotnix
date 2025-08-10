{pkgs, inputs, ...}:
{
  home.packages = with pkgs; [
    inputs.caelestia-shell.packages.${pkgs.system}.default
  ];
}
