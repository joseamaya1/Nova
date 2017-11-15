local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getLevel() <= 15 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello, seeker of knowledge ".. player:getName() ..". How may I assist you?")
	elseif player:getLevel() <= 25 then
		npcHandler:setMessage(MESSAGE_GREET, "Hello, mighty adventurer ".. player:getName() ..". Can I teach you something you don't know?")
	else
		npcHandler:setMessage(MESSAGE_GREET, "Hello, famous ".. player:getName() ..". It should be you teaching me!")
	end	
	return true
end	

keywordHandler:addKeyword({'how are you'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am fine, thank you very much."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My business is knowlegde and it is for free."})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am honored to be teacher in this school."})
keywordHandler:addKeyword({'teacher'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I run this school, there are other travelling teachers who we call Loremasters."})
keywordHandler:addKeyword({'loremaster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "If you are lucky you'll meet one in your journeys."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My name is Phillip."})
keywordHandler:addKeyword({'help'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will provide you with all knowledge I have."})
keywordHandler:addKeyword({'monster'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Monsters come in different shape and power. It's said there is a zoo in the dwarfs' town."})
keywordHandler:addKeyword({'dungeon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dungeons are places of danger and puzzles. In some of them a bright mind will serve you more then a blade."})
keywordHandler:addKeyword({'thank'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "You don't have to thank me, it's only my duty."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To learn about gods, visit the temples and talk to the priests."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The southern king is called Tibianus. He and our queen Eloise are in a constant struggle."})
keywordHandler:addKeyword({'queen'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The southern king is called Tibianus. He and our queen Eloise are in a constant struggle."})
keywordHandler:addKeyword({'rumo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like rumours."})
keywordHandler:addKeyword({'gossip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like rumours."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I don't like rumours."})
keywordHandler:addKeyword({'weapon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To learn about weapons read appropriate books or talk to the smiths."})
keywordHandler:addKeyword({'magic'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "To learn about magic talk to the guild leaders."})
keywordHandler:addKeyword({'rebellion'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Rebellion? What for? We are contend with our situation."})
keywordHandler:addKeyword({'tod'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tod will come and save us all. He will bring freedom and beer to the men of Carlin."})
keywordHandler:addKeyword({'lugri'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This servant of evil is protected by the dark gods and can't be harmed."})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "He is a follower of evil. His powers were boosted by a sinister force and he is beyond human restrictions now."})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "This weapon is said to be very powerful and unique. It was hidden in ancient times and now is thought to be lost."})

local function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	end
	if msgcontains(msg, 'sewer') then
		local npc = Npc()
		if player:getSex() == PLAYERSEX_MALE then
			npc:say("An interesting place you should consider to visit.", TALKTYPE_SAY)
		else
			npc:say("The sewers of Carlin are a disgusting place. Better never crawl around in these stinking tunnels.", TALKTYPE_SAY)
		end
	end
    return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())