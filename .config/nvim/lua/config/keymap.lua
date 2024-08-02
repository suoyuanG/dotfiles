local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}
local map = vim.api.nvim_set_keymap

map('i', '<C-h>', '<Left>', { noremap = true, silent = true })
map('i', '<C-l>', '<Right>', { noremap = true, silent = true })
map('i', '<C-j>', '<Down>', { noremap = true, silent = true })
map('i', '<C-k>', '<Up>', { noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

map('n', '<C-Up>', ':resize -2<CR>', opts)
map('n', '<C-Down>', ':resize +2<CR>', opts)
map('n', '<C-Left>', ':vertical resize -2<CR>', opts)
map('n', '<C-Right>', ':vertical resize +2<CR>', opts)

map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)

map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)
map("n", "<Space>ff", "<cmd>Telescope find_files<cr>", opts)
map("n", "<Space>fr", "<cmd>Telescope oldfiles<cr>", opts)
map("n", "<Space>fg", "<cmd>Telescope live_grep<cr>",  opts)
map("n", "<Space>fc", "<cmd>Telescope grep_string<cr>",  opts)
map("n", "<Space>ft", "<cmd>TodoTelescope<cr>", opts)

map('n', '<F5>', "<cmd> require'dap'.continue()<CR>", opts)
map('n', '<F10>', "<cmd> require'dap'.step_over()<CR>", opts)
map('n', '<F11>', "<cmd> require'dap'.step_into()<CR>", opts)
map('n', '<S-F11>', "<cmd> require'dap'.step_out()<CR>", opts)
map('n', '<C-F5>', "<cmd> require'dap'.repl.open()<CR>", opts)
map('n', '<Space>b', "<cmd> require'dap'.toggle_breakpoint()<CR>", opts)

map('n', '<Space>th', '<cmd> ToggleTerm direction=horizontal<cr>', opts)
map('n', '<space>tf', '<cmd> ToggleTerm direction=float<cr>', opts)
map('n', '<space>tv', '<cmd> ToggleTerm direction=vertical<cr>', opts)

map('n', '<space>e', '<cmd> Neotree filesystem reveal left<cr>', opts)
map('n', '<space>ec', '<cmd> Neotree close<cr>', opts)
