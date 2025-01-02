return {
    'nvim-telescope/telescope.nvim', tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
	local builtin = require('telescope.builtin')
	vim.keymap.set('n', '<C-p>', function() builtin.find_files(require("telescope.themes").get_dropdown {
   layout_config = {
        prompt_position = "top",
        anchor = "NW",
      },
      previewer = false, 
    }) end, { desc = 'Telescope find files' })
    end
}


