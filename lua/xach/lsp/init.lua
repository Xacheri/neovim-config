local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status _ok, mason_lsp_config = pcall(require, "mason-lspconfig")

if not status_ok then
  return
end


-- config icons for mason

mason.setup({
  ui = {
    icons = {
      package_installed = "",
      package_pending = "",
      package_uninstalled = ""
    }  
  }
})

mason_lsp_config.setup({
  -- lsps 
  ensure_installed = {
    "tsserver",
    "html",
    "cssls",
    "lua_ls",
    "omnisharp"
  },
  automatic_installation = true,
})

mason_lsp_config.setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function (server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              settings = {

              }
            }
        end,
        ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup {
            settings = {
                Lua = {
                  diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = {'vim'},
                    },
                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = {
                            [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                            [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                        },
                        -- Adjust as needed: set this to your project's root directory
                        maxPreload = 1000,
                        preloadFileSize = 1000,
                    },
                  }
                }
              }
        end,
}
