{ stdenv, lib, pkgs, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "clife-${version}";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "Neutracity";
    repo = "CLife";
    rev = "fac9f28c2b1c403ac6be77b9dcaab39eefb921e7"; # If there is a release like v1.0, otherwise put the commit directly 
    sha256 = "YYRh4+n/P4+yICjCNc3aCli+VlH5rEkmwJGgcFxcFI8="; # <-- dummy hash: after the first compilation this line will give an error and the correct hash. Replace lib.fakeSha256 with "givenhash". Or use nix-prefetch-git. On older nix, this might fail, use sha256 = lib.fakeSha256; instead.
  };

  nativeBuildInputs = [ ];
  buildInputs = with pkgs; [ SDL2 ];

  buildPhase = ''
    gcc GOL.c -o clife -Iinclude -lpthread -Llib -lSDL2
  '';

  installPhase = ''
    mkdir -p $out/bin
    cp clife $out/bin
  '';
}
