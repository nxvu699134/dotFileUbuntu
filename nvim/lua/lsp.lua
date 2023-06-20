local types = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "💡",
}

for type, icon in pairs(types) do
  local text_hl = "DiagnosticSign" .. type
  local num_hl = "DiagnosticVirtualText" .. type
  vim.fn.sign_define(
    text_hl,
    {
      texthl = text_hl,
      text = icon,
      numhl = num_hl,
    }
  )
end

-- local map_opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap('n', '<leader>jd', '<cmd>vsp | lua vim.lsp.buf.definition()<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>ei', '<cmd>lua vim.diagnostic.open_float()<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>lua vim.diagnostic.goto_next({enable_popup = false})<CR>', map_opts)
-- vim.api.nvim_set_keymap('n', '<leader>ep', '<cmd>lua vim.diagnostic.goto_prev({enable_popup = false})<CR>', map_opts)
-- vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", map_opts)
-- vim.api.nvim_set_keymap("v", "<leader>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", map_opts)

local lsp_signature_attach = function()
end

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    doc_lines = 2,
    max_height = 4,
    floating_window = true,
    floating_window_above_cur_line = true,
    padding = " ",
    hint_enable = false,
    hi_parameter = "DiffText",
    hint_prefix = "  ",
    hint_scheme = "Ignore",
    handler_opts = {
      border = "none",
    },
  }, bufnr)

  -- Set autocommands conditional on server_capabilities
  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = vim.lsp.buf.document_highlight,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end

  -- Turn off semantic highlight, it seems buggy to me
  client.server_capabilities.semanticTokensProvider = nil

  -- if client.resolved_capabilities.document_formatting then
  --   vim.cmd("")
  --   vim.api.nvim_exec([[
  --     augroup lsp_formatting
  --       autocmd! * <buffer>
  --       autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
  --     augroup END
  --   ]], false)
  -- end
end

vim.lsp.handlers["textDocument/publishDiagnostics"] =
  vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    signs = true,
    underline = true,
    update_in_insert = false
  })

-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{ on_attach = on_attach, }
require'lspconfig'.cssls.setup{ on_attach = on_attach, }
require'lspconfig'.eslint.setup{ on_attach = on_attach, }

-- npm i -g cssmodules-language-server
-- require'lspconfig'.cssmodules_ls.setup{ on_attach = on_attach, init_options = {camelCase = false} }

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{ on_attach = on_attach, }

-- npm install -g svelte-language-server
require'lspconfig'.svelte.setup{ on_attach = on_attach, }

-- npm install -g @angular/language-server
-- require'lspconfig'.angularls.setup{ on_attach = on_attach }

-- require'lspconfig'.gopls.setup{ on_attach = on_attach}
--
-- require'lspconfig'.clangd.setup{}
