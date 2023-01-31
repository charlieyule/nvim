local lang_global = require("languages.global")

lang_global.add_language_server("gopls")
lang_global.add_null_ls_source(lang_global.FORMATTING, "gofumpt")
lang_global.add_null_ls_source(lang_global.DIAGNOSTICS, "golangci_lint")
lang_global.add_telescope_ingore_pattern("vendor")
