{ pkgs, ... }:
{
	home.pointerCursor = {
		hyprcursor.enable = true;
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		gtk.enable = true;
		x11.enable = true;
	};

	home.sessionVariables = {
		XCURSOR_THEME = "Bibata-Modern-Classic";
		XCURSOR_SIZE = "24";
		HYPRCURSOR_THEME = "Bibata-Modern-Classic";
	};

	wayland.windowManager.hyprland.settings.env = [
		"XCURSOR_THEME,Bibata-Modern-Classic"
		"XCURSOR_SIZE,24"
		"HYPRCURSOR_THEME,Bibata-Modern-Classic"
	];
}
