{ stdenv, fetchFromGitHub }:
stdenv.mkDerivation rec {
  pname = "where-is-my-sddm-theme";
  version = "v1.12.0";
  dontBuild = true;
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src/where_is_my_sddm_theme $out/share/sddm/themes/where-is-my-sddm-theme
  '';
  src = fetchFromGitHub {
    owner = "stepanzubkov";
    repo = "where-is-my-sddm-theme";
    rev = "2fddf85ec80ff02a8e20fdcba51a30b436d76e6c";
    sha256 = "EzO+MTz1PMmgeKyw65aasetmjUCpvilcvePt6HJZrpo=";
  };
}  


