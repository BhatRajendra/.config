vim.opt.termguicolors = true

require("bufferline").setup{
    options = {
        hover = {
            enabled = true,
            delay = 150,
            reveal = {'close'}
        }
    }
}
--keymaps
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end
which_key.register(
    {
        [ "bp"] = { "<Cmd>BufferLineTogglePin<CR>", "Toggle pin" },
        [ "bP"] = { "<Cmd>BufferLineGroupClose ungrouped<CR>", "Delete non-pinned buffers" },
        [ "bo"] = { "<Cmd>BufferLineCloseOthers<CR>", "Delete other buffers" },
        [ "br"] = { "<Cmd>BufferLineCloseRight<CR>", "Delete buffers to the right" },
        [ "bl"] = { "<Cmd>BufferLineCloseLeft<CR>", "Delete buffers to the left" },
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
which_key.register({
        [ "<S-h>"] = { "<cmd>BufferLineCyclePrev<CR>", "Prev buffer" },
        [ "<S-l>"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
        [ "[b"] = { "<cmd>BufferLineCyclePrev<CR>", "Prev buffer" },
        [ "]b"] = { "<cmd>BufferLineCycleNext<CR>", "Next buffer" },
    })
