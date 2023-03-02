local status_ok, tmux = pcall(require, "tmux")
if not status_ok then
	return
end

tmux.setup({
	copy_sync = {
		enable = true,

		-- ignore specific tmux buffers e.g. buffer0 = true to ignore the
		-- first buffer or named_buffer_name = true to ignore a named tmux
		-- buffer with name named_buffer_name :)
		ignore_buffers = { empty = false },

		-- overwrites vim.g.clipboard to redirect * and + to the system
		-- clipboard using tmux. If you sync your system clipboard without tmux,
		-- disable this option!
		sync_clipboard = true,

		-- synchronizes registers *, +, unnamed, and 0 till 9 with tmux buffers.
		sync_registers = true,

		-- syncs deletes with tmux clipboard as well, it is adviced to
		-- do so. Nvim does not allow syncing registers 0 and 1 without
		-- overwriting the unnamed register. Thus, ddp would not be possible.
		sync_deletes = true,

		-- syncs the unnamed register with the first buffer entry from tmux.
		sync_unnamed = true,
	},
	navigation = {
		-- enables default keybindings (C-hjkl) for normal mode
		enable_default_keybindings = true,

		-- prevents unzoom tmux when navigating beyond vim border
		persist_zoom = false,
	},
})
