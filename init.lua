local owofaces = {
	"OwO",
	"owo",
	"UwU",
	"uwu",
	"^w^",
	">w<"
}

local storage = core.get_mod_storage()
local enabled = (storage:get('enabled')) or 1
-- LOL
enabled = (enabled == 1)

core.register_on_chat_message(function(name, message)
	if enabled then
		core.chat_send_all(core.format_chat_message(name,
			message:gsub(".", {r = "w", R = "W", l = "w", L = "W"}) .. " " .. owofaces[math.random(#owofaces)]))

		return true
	end
end)

core.register_chatcommand("owospeak", {
	params = "",
	description = "Toggles OwOspeak",
	privs = { server = true },
	func = function(name, param)
		if enabled then
			core.chat_send_player(name, core.colorize("#ff0000", "Disabled OwOspeak"))
			storage:set_int('enabled', 0)
			enabled = false
		else
			core.chat_send_player(name, core.colorize("#00ff00", "Enabled OwOspeak"))
			storage:set_int('enabled', 1)
			enabled = true
		end
	end,
})
