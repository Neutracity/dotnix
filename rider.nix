{ lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    dotnet-sdk_6
    msbuild
    mono
  ];
}
