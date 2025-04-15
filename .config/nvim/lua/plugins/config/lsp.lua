local lspconfig = require("lspconfig")
local mason_lspconfig = require("mason-lspconfig")
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local navic = require("nvim-navic")

require('mason').setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    update_in_insert = true,
  }
)

-- local capabilities = require("mini.completion").get_lsp_capabilities()
-- vim.lsp.config('*', { capabilities = capabilities })

local keymap = vim.keymap

vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(ev)
    local opts = { buffer = ev.buf, silent = true }
    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)       -- smart rename
    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
    opts.desc = "Go to previous diagnostic"
    keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)         -- jump to previous diagnostic in buffer
    opts.desc = "Go to next diagnostic"
    keymap.set("n", "]d", vim.diagnostic.goto_next, opts)         -- jump to next diagnostic in buffer
    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)                 -- show documentation for what is under cursor
    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)        -- mapping to restart lsp if necessary
  end,
})


mason_lspconfig.setup({
  ensure_installed = { 'pylsp', 'lua_ls' },
})

mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
  ["lua_ls"] = function()
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })
  end,
  lspconfig.clangd.setup({
    on_attach = function(client, buffer)
      if client.supports_method("textDocument/inlayHint", { bufnr = buffer }) then
        vim.lsp.inlay_hint.enable(true, { bufnr = buffer })
      end
      if client.supports_method("textDocument/codeLens", { bufnr = buffer }) then
        local cur_bufnr = vim.api.nvim_get_current_buf();
        if buffer == cur_bufnr then
          vim.lsp.codelens.refresh({ bufnr = cur_bufnr })
        end
        vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave" }, {
          group = require("util").augroup("lsp_codelens"),
          buffer = buffer,
          callback = function()
            vim.lsp.codelens.refresh({ bufnr = buffer })
          end,
        })
      end
      navic.attach(client, buffer)
    end,
    capabilities = capabilities,
    cmd = {
      "clangd",
      "-j=12",
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
      completions = {
        completeFunctionCalls = true
      }
    },
  })
})
