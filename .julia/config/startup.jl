ENV["JULIA_PKG_TOKEN_PATH"] = joinpath(homedir(),".julia","token.toml")

atreplinit() do repl
    try
        @eval using Revise
        @async Revise.wait_steal_repl_backend()
    catch
    end
end
