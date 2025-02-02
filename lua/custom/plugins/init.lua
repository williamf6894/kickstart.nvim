-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'kdheepak/lazygit.nvim',
    lazy = true,
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
  },
  {
    'HiPhish/rainbow-delimiters.nvim',
  },
  {
    'rebelot/terminal.nvim',
    config = function()
      require('terminal').setup()
      local term_map = require 'terminal.mappings'
      vim.keymap.set({ 'n', 'x' }, '<leader>tx', term_map.operator_send, { expr = true, desc = 'Send a command to the terminal' })
      vim.keymap.set('n', '<leader>to', term_map.toggle, { desc = '[To]ggle terminal' })
      vim.keymap.set('n', '<leader>tO', term_map.toggle { open_cmd = 'enew' }, { desc = 'Open new terminal' })
      vim.keymap.set('n', '<leader>tr', term_map.run, { desc = 'Run a command' })
      vim.keymap.set('n', '<leader>tR', term_map.run(nil, { layout = { open_cmd = 'enew' } }), { desc = 'Run a command in a new terminal and open' })
      vim.keymap.set('n', '<leader>tk', term_map.kill, { desc = 'Kill a terminal' })
      vim.keymap.set('n', '<leader>t]', term_map.cycle_next, { desc = 'Next terminal' })
      vim.keymap.set('n', '<leader>t[', term_map.cycle_prev, { desc = 'Previous terminal' })
      vim.keymap.set('n', '<leader>tl', term_map.move { open_cmd = 'belowright vnew' }, { desc = 'Move terminal to the bottom right' })
      vim.keymap.set('n', '<leader>tL', term_map.move { open_cmd = 'botright vnew' }, { desc = 'Move terminal to the right' })
      vim.keymap.set('n', '<leader>th', term_map.move { open_cmd = 'belowright new' }, { desc = 'Move terminal to the bottom' })
      vim.keymap.set('n', '<leader>tH', term_map.move { open_cmd = 'botright new' }, { desc = 'Move terminal to the bottom full' })
      vim.keymap.set('n', '<leader>tf', term_map.move { open_cmd = 'float' }, { desc = 'Float terminal' })
    end,
  },
  {
    'olexsmir/gopher.nvim',
    ft = 'go',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    ---@type gopher.Config
    opts = {},
  },
  {
    'Exafunction/codeium.nvim',
    lazy = true,
    event = 'BufEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('codeium').setup {}
      local cmp = require 'cmp'
      local cmpconfig = cmp.get_config()
      table.insert(cmpconfig.sources, {
        name = 'codeium',
      })
      cmp.setup(cmpconfig)
    end,
  },
}
