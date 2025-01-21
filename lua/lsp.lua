-- Python lsp server
-- Require installing python-lsp-server
-- Use "pip install python-lsp-server
require('lspconfig').pylsp.setup{}

-- C++ lsp server
-- Require installing clang
-- Install clangd using "brew install llvm"
-- Then add to the PATH as "export PATH="/opt/homebrew/opt/llvm/bin:$PATH"
require('lspconfig').clangd.setup{}

