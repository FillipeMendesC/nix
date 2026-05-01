{ ... }:
{
	

	home.file.".local/bin/hyprdim-toggle" = {
		executable = true;
		text = ''
			#!/usr/bin/env sh
			if pgrep -x hyprdim >/dev/null 2>&1; then
				pkill -x hyprdim
			else
				hyprdim
			fi
		'';
	};
}
