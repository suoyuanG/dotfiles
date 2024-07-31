local lspconfig = require('lspconfig')
local navic = require("nvim-navic")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true 

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
  flags = {
    debounce_text_changes = 150,  -- 可以调整为更低的值来更频繁地更新诊断信息
  },
  capabilities = capabilities,
  cmd = { "clangd", 
          "--background-index", 
          "--cross-file-rename",
          "--clang-tidy",
         "--all-scopes-completion",
         "--cross-file-rename",
         "--completion-style=detailed",
         "--header-insertion-decorators",
         "--header-insertion=iwyu",
         "--pch-storage=memory",
        },
  settings = {
    clangd = {
      arguments = { "--compile-commands-dir=build" },  -- 根据你的项目调整这个参数
    },
  },
})

