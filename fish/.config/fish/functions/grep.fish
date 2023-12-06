function grep
	if type -q rg
		rg $argv
		return
	end

	grep $argv
end
