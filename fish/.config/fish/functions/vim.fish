function vim
    if type -q hx
        hx $argv
        return
    end

    if type -q nvim
        nvim $argv
        return
    end

    if type -q vim
        vim $argv
        return
    end

    vi $argv
end
