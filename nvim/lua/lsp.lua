vim.fn.sign_define(
    "LspDiagnosticsSignError",
    {
      texthl = "LspDiagnosticsSignError",
      text = "",
      numhl = "LspDiagnosticsVirtualTextError"
    }
)

vim.fn.sign_define(
    "LspDiagnosticsSignWarning",
    {
      texthl = "LspDiagnosticsSignWarning",
      text = "",
      numhl = "LspDiagnosticsVirtualTextWarning"
    }
)

vim.fn.sign_define(
    "LspDiagnosticsSignInformation",
    {
      texthl = "LspDiagnosticsSignInformation",
      text = "",
      numhl = "LspDiagnosticsVirtualTextInfomation"
    }
)

vim.fn.sign_define(
    "LspDiagnosticsSignHint",
    { texthl = "LspDiagnosticsSignHint",
    text = "💡",
    numhl = "LspDiagnosticsVirtualTextHint"
  }
)

local map_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<leader>jd', '<cmd>vsp<CR> <cmd>lua vim.lsp.buf.definition()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>jr', '<cmd>lua vim.lsp.buf.references()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>h', '<cmd>lua vim.lsp.buf.hover()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.code_action()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>ei', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>en', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', map_opts)
vim.api.nvim_set_keymap('n', '<leader>ep', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', map_opts)
vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", map_opts)
-- vim.api.nvim_set_keymap("v", "<leader>p", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", map_opts)

local lsp_signature_attach = function()
  require "lsp_signature".on_attach({
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    doc_lines = 2,
    max_height = 4,
    floating_window = false,
    hint_enable = true,
    hi_parameter = "LspDiagnosticsVirtualTextWarning",
    hint_prefix = "  ",
    hint_scheme = "Ignore",
    handler_opts = {
      border = "none",
    },
  })
end

local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  lsp_signature_attach()

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end

  -- Disable to prevent conflict with other formatter(e.g: prettier, )
  client.resolved_capabilities.document_formatting = false

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

-- npm i -g vscode-langservers-extracted
require'lspconfig'.html.setup{ on_attach = on_attach }
require'lspconfig'.cssls.setup{ on_attach = on_attach }

-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{ on_attach = on_attach }

-- npm install -g svelte-language-server
require'lspconfig'.svelte.setup{ on_attach = on_attach }
