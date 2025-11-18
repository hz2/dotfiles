return {
    servers = {
        rust_analyzer = {
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        features = "all",
                    },
                    checkOnSave = {
                        enable = true,
                    },
                    check = {
                        command = "clippy",
                    },
                    imports = {
                        group = {
                            enable = false,
                        },
                    },
                    completion = {
                        postfix = {
                            enable = false,
                        },
                    },
                }
            }
        }
    }
}
