{pkgs,...}:
{
  environment.systemPackages = with pkgs; [
    # Existing packages...
    (import (builtins.fetchGit {
      url = "https://github.com/caelestia-dots/shell";
      ref = "main";
      rev = "<commit-hash>";
    }) {}).packages.${pkgs.system}.default
  ];
}