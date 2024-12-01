{
  lib,
  makeDesktopItem,
}:
{

  desktopItems =
    let
  meta = with lib; {
    description = "Ultimaker Cura Printing Slicing Software";
    homepage = "https://ultimaker.com/es/software/ultimaker-cura/";
    changelog = "https://github.com/Ultimaker/Cura/releases/tag/${finalAttrs.version}";
    license = licenses.lgpl3Plus;
    platforms = platforms.linux;
    mainProgram = "cura";
  };
      
    in [
    (makeDesktopItem {
      name = "cura";
      exec = "cura";
      terminal = false;
      desktopName = "Ultimaker Cura";
      comment = meta.description;
      categories = [ "Utility" ];
    })
  ];

}
