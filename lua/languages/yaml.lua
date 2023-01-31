local lang_global = require("languages.global")

lang_global.add_language_server("yamlls")
lang_global.add_null_ls_source(lang_global.FORMATTING, "yamlfmt")
