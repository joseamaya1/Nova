local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addBuyableItem({'leather helmet'}, 					Cfleatherhelmet, 12)
shopModule:addBuyableItem({'studded helmet'}, 					Cfstuddedhelmet, 63)
shopModule:addBuyableItem({'sandals'}, 					Cfsandals, 2)
shopModule:addBuyableItem({'leather boots'}, 					Cfleatherboots, 2)
shopModule:addBuyableItem({'leather legs'}, 					Cfleatherlegs, 10)
shopModule:addBuyableItem({'studded legs'}, 					Cfstuddedlegs, 60)

keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I'm Aldo. No one calls me 'lucky Aldo' though, guess why!"})
keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am a salesman, I sell headgear ... uhm ... oh well, and shoes."})
keywordHandler:addKeyword({'time'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Is it time for lunch already? Hey, stop making fun of me!"})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I will sell the king a pair of shoes made by me and will get out of that stinky hole I live in and my family will never find me. HE, HE!"})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "One day I will sell the king a pair of shoes made by me and will get out of that stinky hole I live in and my family will never find me. HE, HE!"})
keywordHandler:addKeyword({'army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "So many feet ... so many ... a nightmare!"})
keywordHandler:addKeyword({'ferumbras'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Can't be worse than my wife."})
keywordHandler:addKeyword({'wife'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Leave me alone with her while I am working at least. My only pleasure around here!"})
keywordHandler:addKeyword({'excalibug'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I have other stuff to worry about, like paying my bills."})
keywordHandler:addKeyword({'bill'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes, I have to pay o lot of bills, and some georges, and a john, and several steves."})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I will never in my life make it there."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I doubt I will ever see much of it. It's like i am cursed to haunt this site here for the rest of my life."})
keywordHandler:addKeyword({'carlin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "A city ruled by women!? Could anything be worse?"})
keywordHandler:addKeyword({'amazon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I heard that chicks wear some revealing pieces of armor!"})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, I am a man. Look for some women to share gossip."})
keywordHandler:addKeyword({'rumor'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, I am a man. Look for some women to share gossip."})
keywordHandler:addKeyword({'rumour'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hey, I am a man. Look for some women to share gossip."})
keywordHandler:addKeyword({'hugo'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "My boss, an evil slaver of good people like me."})
keywordHandler:addKeyword({'offer'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am damned to sell headgear, trousers, and shoes for the rest of my life."})
keywordHandler:addKeyword({'good'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am damned to sell headgear, trousers, and shoes for the rest of my life."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am damned to sell headgear, trousers, and shoes for the rest of my life."})
keywordHandler:addKeyword({'have'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I am damned to sell headgear, trousers, and shoes for the rest of my life."})
keywordHandler:addKeyword({'headgear'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We have leather helmets and studded helmets."})
keywordHandler:addKeyword({'shoes'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "<sigh> We sell leather boots and sandals."})
keywordHandler:addKeyword({'trouser'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "We offer leather legs and studded legs."})

npcHandler:addModule(FocusModule:new())