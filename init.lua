local owofaces = {
	"OwO",
	"owo",
	"UwU",
	"uwu",
	"^w^",
	">w<"
}

minetest.register_on_chat_message(function(name, message)
	message = message:gsub("R", "W")
					 :gsub("r", "w")
					 :gsub("L", "W")
					 :gsub("l", "w")

	minetest.chat_send_all("<"..name.."> "..message.." "..owofaces[math.random(#owofaces)])

	return true
end)