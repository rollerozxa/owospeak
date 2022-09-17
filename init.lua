local owofaces = {
	"OwO",
	"owo",
	"UwU",
	"uwu",
	"^w^",
	">w<"
}

local storage = minetest.get_mod_storage()
local enabled = (storage:get('enabled')) or 1
-- LOL
enabled = (enabled == 1)

minetest.register_on_chat_message(function(name, message)
	if enabled then
		minetest.chat_send_all(minetest.format_chat_message(name,
			message:gsub(".", {r = "w", R = "W", l = "w", L = "W"}) .. " " .. owofaces[math.random(#owofaces)]))

		return true
	end
end)

minetest.register_chatcommand("owospeak", {
	params = "",
	description = "Toggles OwOspeak",
	privs = { server = true },
	func = function(name, param)
		if enabled then
			minetest.chat_send_player(name, minetest.colorize("#ff0000", "Disabled OwOspeak"))
			storage:set_int('enabled', 0)
			enabled = false
		else
			minetest.chat_send_player(name, minetest.colorize("#00ff00", "Enabled OwOspeak"))
			storage:set_int('enabled', 1)
			enabled = true
		end
	end,
})
