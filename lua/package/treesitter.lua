return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
  config = function()
    -- diagnostics = { disable = { 'missing-fields' }}
    require("nvim-treesitter.configs").setup(
      {
        ensure_installed = {
          "go",
          "terraform",
          "hcl",
          "sql",
        },
        sync_install = true,
        highlight = { enable = true },
        indent = { enable = true },
      }
    )
  end
}
