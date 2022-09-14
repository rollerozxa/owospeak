local owofaces = {
	"OwO",
	"owo",
	"UwU",
	"uwu",
	"^w^",
	">w<"
}

minetest.register_on_chat_message(function(name, message)
	minetest.chat_send_all(minetest.format_chat_message(name,
		message:gsub(".", {r = "w", R = "W", l = "w", L = "W"}) .. " " .. owofaces[math.random(#owofaces)]))
	return true
end)
