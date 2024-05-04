local status_ok = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("xach.lsp.mason")
require("xach.lsp.handlers").setup()
require "xach.lsp.null-ls"
