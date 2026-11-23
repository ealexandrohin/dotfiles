require("git"):setup({
	order = 1500,
})

local function try(f)
	local ok, res = pcall(f)
	return (ok and res) or ""
end

-- size owner permissions btime
function Linemode:all()
	local file = self._file
	local stat = file.stat or file.cha

	-- size
	local size_str = try(function()
		local size = file:size()
		if size then
			return ya.readable_size(size)
		end
		local folder = cx.tab:history(file.url)
		return folder and tostring(#folder.files) or ""
	end)

	-- owner
	local owner_str = try(function()
		local user = ya.user_name and ya.user_name(stat.uid) or stat.uid
		local group = ya.group_name and ya.group_name(stat.gid) or stat.gid
		return string.format("%s:%s", user, group)
	end)

	-- permissions
	local perm_str = try(function()
		return stat:perm() or ""
	end)

	-- btime
	local btime_str = try(function()
		local btime = stat.btime

		if not btime then
			return ""
		end

		return os.date("%H:%M %d/%m/%Y", math.floor(btime))
	end)

	return string.format("%6s %9s %10s %16s", size_str, owner_str, perm_str, btime_str)
end
