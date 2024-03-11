
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        -- defaults = {
        --   mappings = {
        --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
        --   },
        -- },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable telescope extensions, if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

local builtin = require 'telescope.builtin'

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      -- Also possible to pass additional configuration options.
      --  See `:help telescope.builtin.live_grep()` for information about particular keys

--keymaps
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end
which_key.register(
    {
        ["fc"] = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
        ["sn"]={ 
            function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end,"[S]earch [N]eovim files"},
        ['sh']={ builtin.help_tags, '[S]earch [H]elp' },
        ['sk']={ builtin.keymaps, '[S]earch [K]eymaps' },
        ['<leader>']={ builtin.find_files, '[S]earch [F]iles' },
        ['ss']={ builtin.builtin, '[S]earch [S]elect Telescope' },
        ['sw']={ builtin.grep_string, '[S]earch current [W]ord' },
        ['sg']={ builtin.live_grep, '[S]earch by [G]rep' },
        ['sd']={ builtin.diagnostics, '[S]earch [D]iagnostics' },
        ['sr']={ builtin.resume, '[S]earch [R]esume' },
        ['s.']={ builtin.oldfiles, '[S]earch Recent Files ("." for repeat)' },
        ['sf']={ builtin.buffers, '[ ] Find existing buffers' },
        ['s/']= {
            function()
                builtin.live_grep {
                  grep_open_files = true,
                  prompt_title = 'Live Grep in Open Files',
                }
            end, '[S]earch [/] in Open Files' },
        ['/']= {
            function()
                builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                winblend = 10,
                previewer = false,
                })
            end, '[/] Fuzzily search in current buffer' },
    },
     {
        mode = "n", -- NORMAL mode
        prefix = "<leader>",-- NOTE:
        buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
        silent = true, -- use `silent` when creating keymaps
        noremap = true, -- use `noremap` when creating keymaps
        nowait = true, -- use `nowait` when creating keymaps
    }
)
