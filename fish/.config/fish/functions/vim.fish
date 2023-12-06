function vim
	if type -q nvim
		nvim $argv
		return
	end

	vim $argv
end
