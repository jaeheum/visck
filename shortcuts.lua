-- insert digraphs using awk and plan9 keyboard instead of vis-digraph(1)
-- keyboard from wget https://raw.githubusercontent.com/9fans/plan9port/master/lib/keyboard

vis:map(vis.modes.INSERT, "<C-k>", function(keys)
	if #keys < 2 then
		return -1 -- need more input
	end
	-- N.B. note %%s in awk. a lone %s makes string.format() look for another nonexistent arg
	local keyboard = [[$HOME/.config/vis/plugins/keyboard]] 
	local file = io.popen(string.format([[awk -v key='%s' '$2==key{printf("%%s", $3)}' %s 2>&1]], keys:gsub("'", "'\\''"), keyboard))
	local output = file:read('*all')
	local success, msg, status = file:close()
	if success then
		if vis.mode == vis.modes.INSERT then
			vis:insert(output)
		elseif vis.mode == vis.modes.REPLACE then
			vis:replace(output)
		end
	elseif msg == 'exit' then
		if status == 2 then
			return -1 -- prefix need more input
		end
		vis:info(output)
	end
	return #keys
end, "Insert digraph with plan9 keyboard")
