{ lib, pkgs , ... }:

{
  environment.systemPackages = with pkgs; [
    jetbrains.rider
    dotnet-sdk_7
    msbuild
    mono
  ];
}
