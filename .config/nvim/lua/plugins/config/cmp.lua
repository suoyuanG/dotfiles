-- local luasnip = require("luasnip")
local cmp = require("cmp")


local kind_icons = {
  Text = '',
  Method = '󰆧',
  Function = '󰊕',
  Constructor = '',
  Field = '󰇽',
  Variable = '󰂡',
  Class = '󰠱',
  Interface = '',
  Module = '',
  Property = '󰜢',
  Unit = '',
  Value = '󰎠',
  Enum = '',
  Keyword = '󰌋',
  Snippet = '',
  Color = '󰏘',
  File = '󰈙',
  Reference = '',
  Folder = '󰉋',
  EnumMember = '',
  Constant = '󰏿',
  Struct = '',
  Event = '',
  Operator = '󰆕',
  TypeParameter = '󰅲',
}

local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
      and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s")
      == nil
end

-- require("luasnip.loaders.from_vscode").lazy_load()
-- require("snippets").setup({ friendly_snippets = true })

-- luasnip.setup({
--     update_events = { "TextChanged", "TextChangedI" },
--     region_check_events = { "CursorMoved", "CursorHold", "InsertEnter", "CursorMovedI" },
--     history = true,
-- })

cmp.setup({
   completion = {
      completeopt = 'menu,menuone,noinsert',
  },
  snippet = {
      expand = function(args)
        vim.snippet.expand(args.body)
      end,
  },
  mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs( -4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if vim.snippet.active({ direction = 1 }) then
          vim.snippet.jump(1)
        elseif cmp.visible() then
          cmp.select_next_item()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
        end
        end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function()
        if vim.snippet.active({ direction = -1 }) then
          vim.snippet.jump(-1)
        elseif cmp.visible() then
          cmp.select_prev_item()
        end
        end, { "i", "s" }),

  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
   matching = {
    disallow_fuzzy_matching = true,
    disallow_fullfuzzy_matching = true,
    disallow_partial_fuzzy_matching = false,
    disallow_partial_matching = false,
    disallow_prefix_unmatching = true,
  },
  formatting = {
    expandable_indicator = true,
    format = function(entry, vim_item)
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatenates the icons with the name of the item kind
      vim_item.menu = ({
        buffer = '[Buffer]',
        nvim_lsp = '[LSP]',
        luasnip = '[LuaSnip]',
        nvim_lua = '[Lua]',
        latex_symbols = '[LaTeX]',
      })[entry.source.name]
      return vim_item
    end,
    fields = { 'abbr', 'kind', 'menu' },
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'snippets' },
    { name = 'buffer' },
    { name = 'path' },
    { name = 'nvim_lsp_signature_help' }
  })
})
