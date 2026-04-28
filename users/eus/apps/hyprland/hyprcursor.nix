{ pkgs, ... }:
{
	home.pointerCursor = {
		package = pkgs.bibata-cursors;
		name = "Bibata-Modern-Classic";
		size = 24;
		gtk.enable = true;
		x11.enable = true;
	};

	home.sessionVariables = {
		XCURSOR_THEME = "Bibata-Modern-Classic";
		XCURSOR_SIZE = "24";
		HYPRCURSOR_THEME = "Bibata-Modern-Classic";
		HYPRCURSOR_SIZE = "24";
	};

	wayland.windowManager.hyprland.settings.env = [
		"XCURSOR_THEME,Bibata-Modern-Classic"
		"XCURSOR_SIZE,24"
		"HYPRCURSOR_THEME,Bibata-Modern-Classic"
		"HYPRCURSOR_SIZE,24"
	];
}
