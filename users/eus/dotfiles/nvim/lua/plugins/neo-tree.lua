require('neo-tree').setup {
	close_if_last_window = true,
	enable_git_status = true,
	enable_diagnostics = true,
	sort_case_insensitive = true,
	hijack_netrw_behavior = 'open_default',

	window = {
		position = 'left',
		width = 32,
		auto_expand_width = true,
	},

	filesystem = {
		follow_current_file = { enabled = true },
		filtered_items = {
			visible = true,
			hide_dotfiles = false,
			hide_gitignored = false,
		},
		use_libuv_file_watcher = true,
	},

	buffers = {
		follow_current_file = { enabled = true },
	},

	git_status = {
		window = {
			position = 'float',
		},
	},
}