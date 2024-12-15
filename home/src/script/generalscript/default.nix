{
  config,
  lib,
  pkgs,
  ...
}: let
  better-nmtui = pkgs.writeShellScriptBin "better-nmtui" ''
  NEWT_COLORS='
	root=black,black
	window=white,black
	border=white,black
	textbox=white,black
	label=white,black
	title=white,black
	roottext=white,black
	actbutton=white,black
	fullscale=white,black
	entry=white,black
	actcheckbox=white,black
	actlistbox=white,black
	acttextbox=white,black
	sellistbox=white,black
	helpline=white,black
	actsellistbox=white,darkgray
	listbox=white,black
	button=white,black
	actbuttom=white,black
	checkbox=white,black
' nmtui

  '';
in {
  home.packages = with pkgs; [
    better-nmtui
  ];
}

