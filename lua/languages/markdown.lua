local lang_global = require("languages.global")

lang_global.add_plugin({
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  cmd = "MarkdownPreview",
})
lang_global.add_language_server("marksman")
lang_global.add_null_ls_source(lang_global.FORMATTING, "markdownlint")
lang_global.add_null_ls_source(lang_global.DIAGNOSTICS, "markdownlint")
