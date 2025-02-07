{ pkgs, inputs, ... }:
{
  environment.systemPackages = [
    pkgs.seafile-client
  ];
}
