local lang_global = require("languages.global")

lang_global.add_language_server("marksman")
lang_global.add_null_ls_source(lang_global.FORMATTING, "markdownlint")
lang_global.add_null_ls_source(lang_global.DIAGNOSTICS, "markdownlint")
