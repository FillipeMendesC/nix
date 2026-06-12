{ lib, ... }:
{
	programs.hyprlock = {
		enable = true;

		settings = {
			general = {
				hide_cursor = true;
				grace = 2;
			};

        background = lib.mkForce [
        {
          monitor = "";
          path = "screenshot";
          blur_passes = 3;
          blur_size = 8;
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];

        "input-field" = lib.mkForce [
          {
            monitor = "";
            size = "220, 44";
            position = "0, -80";
            outline_thickness = 2;
            dots_size = 0.18;
            dots_spacing = 0.2;
            fade_on_empty = false;
            rounding = 10;
          }
        ];
		};
	};
}
