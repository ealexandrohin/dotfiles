local Utils = {}

function Utils.alacritty(opts)
	opts = opts or {}
	local full = "alacritty"

	if opts.dir then
		full = full .. " --working-directory " .. opts.dir
	end

	if opts.cmd then
		local class = opts.class or opts.cmd

		full = full .. " --class " .. class .. " --title " .. class .. " -e " .. opts.cmd

		if opts.args then
			full = full .. " " .. opts.args
		end
	end

	return full
end

return Utils
