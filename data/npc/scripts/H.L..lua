local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

function onCreatureAppear(cid) npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) npcHandler:onCreatureSay(cid, type, msg) end
function onThink() npcHandler:onThink() end

local function greetCallback(cid)
	local player = Player(cid)
	if player:getSex() == PLAYERSEX_MALE then
		npcHandler:setMessage(MESSAGE_GREET, "Hmmm. I buy weapons, armor, and other stuff. What do you want, ".. player:getName() .."?")
	else
		Npc():say("I don't serve brats. Sod off!", TALKTYPE_SAY)
		npcHandler:resetNpc(cid)
		return false
	end	
	return true
end

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

shopModule:addSellableItem({'two handed sword'}, 					Cftwohandedsword, 60)
shopModule:addSellableItem({'battle axe'}, 					Cfbattleaxe, 40)
shopModule:addSellableItem({'hand axe'}, 					Cfhandaxe, 5)
shopModule:addSellableItem({'spike sword'}, 					Cfspikesword, 25)
shopModule:addSellableItem({'rapier'}, 					Cfrapier, 5)
shopModule:addSellableItem({'sabre'}, 					Cfsabre, 6)
shopModule:addSellableItem({'double axe'}, 					Cfdoubleaxe, 70)
shopModule:addSellableItem({'hatchet'}, 					Cfhatchet, 7)
shopModule:addSellableItem({'spear'}, 					Cfspear, 2)
shopModule:addSellableItem({'magic longsword'}, 					Cfmagiclongsword, 460)
shopModule:addSellableItem({'war hammer'}, 					Cfwarhammer, 90)
shopModule:addSellableItem({'fire sword'}, 					Cffiresword, 335)
shopModule:addSellableItem({'giant sword'}, 					Cfgiantsword, 100)
shopModule:addSellableItem({'morning star'}, 					Cfmorningstar, 50)
shopModule:addSellableItem({'carlin sword'}, 					Cfcarlinsword, 5)
shopModule:addSellableItem({'ice rapier'}, 					Cficerapier, 250)
shopModule:addSellableItem({'longsword'}, 					Cflongsword, 8)
shopModule:addSellableItem({'throwing star'}, 					Cfthrowingstar, 2)
shopModule:addSellableItem({'magic sword'}, 					Cfmagicsword, 350)
shopModule:addSellableItem({'staff'}, 					Cfstaff, 1)
shopModule:addSellableItem({'silver dagger'}, 					Cfsilverdagger, 1)
shopModule:addSellableItem({'combat knife'}, 					Cfcombatknife, 1)
shopModule:addSellableItem({'knife'}, 					Cfweaponknife, 1)
shopModule:addSellableItem({'sickle'}, 					Cfsickle, 1)
shopModule:addSellableItem({'short sword'}, 					Cfshortsword, 3)
shopModule:addSellableItem({'bright sword'}, 					Cfbrightsword, 280)
shopModule:addSellableItem({'warlord sword'}, 					Cfwarlordsword, 360)
shopModule:addSellableItem({'serpent sword'}, 					Cfserpentsword, 15)
shopModule:addSellableItem({'throwing knife'}, 					Cfthrowingknife, 2)
shopModule:addSellableItem({'poison dagger'}, 					Cfpoisondagger, 5)
shopModule:addSellableItem({'katana'}, 					Cfkatana, 8)
shopModule:addSellableItem({'broadsword'}, 					Cfbroadsword, 10)
shopModule:addSellableItem({'dragon lance'}, 					Cfdragonlance, 90)
shopModule:addSellableItem({'great axe'}, 					Cfgreataxe, 300)
shopModule:addSellableItem({'crowbar'}, 					Cfcrowbar, 1)
shopModule:addSellableItem({'battle hammer'}, 					Cfbattlehammer, 40)
shopModule:addSellableItem({'golden sickle'}, 					Cfgoldensickle, 10)
shopModule:addSellableItem({'scimitar'}, 					Cfscimitar, 10)
shopModule:addSellableItem({'machete'}, 					Cfmachete,  6)
shopModule:addSellableItem({'thunder hammer'}, 					Cfthunderhammer, 450)
shopModule:addSellableItem({'iron hammer'}, 					Cfironhammer, 9)
shopModule:addSellableItem({'clerical mace'}, 					Cfclericalmace, 30)
shopModule:addSellableItem({'silver mace'}, 					Cfsilvermace, 2)
shopModule:addSellableItem({'obsidian lance'}, 					Cfobsidianmace, 50)
shopModule:addSellableItem({'naginata'}, 					Cfnaginata, 80)
shopModule:addSellableItem({'guardian halberd'}, 					Cfguardianhalberd, 120)
shopModule:addSellableItem({'orcish axe'}, 					Cforcishaxe, 12)
shopModule:addSellableItem({'barbarian axe'}, 					Cfbarbarianaxe, 30)
shopModule:addSellableItem({'knight axe'}, 					Cfknightaxe, 2)
shopModule:addSellableItem({'stonecutter axe'}, 					Cfstonecutteraxe, 320)
shopModule:addSellableItem({'fire axe'}, 					Cffireaxe, 280)
shopModule:addSellableItem({'crossbow'}, 					Cfcrossbow, 20)
shopModule:addSellableItem({'bow'}, 					Cfbow, 15)
shopModule:addSellableItem({'steel helmet'}, 					Cfsteelhelmet, 60)
shopModule:addSellableItem({'chain helmet'}, 					Cfchainhelmet, 4)
shopModule:addSellableItem({'iron helmet'}, 					Cfironhelmet, 30)
shopModule:addSellableItem({'brass helmet'}, 					Cfbrasshelmet, 8)
shopModule:addSellableItem({'leather helmet'}, 					Cfleatherhelmet, 1)
shopModule:addSellableItem({'devil helmet'}, 					Cfdevilhelmet, 80)
shopModule:addSellableItem({'chain armor'}, 					Cfchainarmor, 30)
shopModule:addSellableItem({'brass armor'}, 					Cfbrassarmor, 50)
shopModule:addSellableItem({'golden armor'}, 					Cfgoldenarmor, 580)
shopModule:addSellableItem({'leather armor'}, 					Cfleatherarmor, 2)
shopModule:addSellableItem({'studded legs'}, 					Cfstuddedlegs, 15)
shopModule:addSellableItem({'dragon scale legs'}, 					Cfdragonscalelegs, 180)
shopModule:addSellableItem({'golden legs'}, 					Cfgoldenlegs, 120)
shopModule:addSellableItem({'golden helmet'}, 					Cfgoldenhelmet, 420)
shopModule:addSellableItem({'magic plate armor'}, 					Cfmagicplatearmor, 720)
shopModule:addSellableItem({'viking helmet'}, 					Cfvikinghelmet, 12)
shopModule:addSellableItem({'winged helmet'}, 					Cfwingedhelmet, 320)
shopModule:addSellableItem({'warrior helmet'}, 					Cfwarriorhelmet, 75)
shopModule:addSellableItem({'knight armor'}, 					Cfknightarmor, 140)
shopModule:addSellableItem({'knight legs'}, 					Cfknightlegs, 130)
shopModule:addSellableItem({'brass legs'}, 					Cfbrasslegs, 15)
shopModule:addSellableItem({'strange helmet'}, 					Cfstrangehelmet, 55)
shopModule:addSellableItem({'legion helmet'}, 					Cflegionhelmet, 8)
shopModule:addSellableItem({'soldier helmet'}, 					Cfsoldierhelmet, 16)
shopModule:addSellableItem({'studded helmet'}, 					Cfstuddedhelmet, 2)
shopModule:addSellableItem({'scale armor'}, 					Cfscalearmor, 75)
shopModule:addSellableItem({'studded armor'}, 					Cfstuddedarmor, 18)
shopModule:addSellableItem({'doublet'}, 					Cfdoublet, 1)
shopModule:addSellableItem({'rose armor'}, 					Cfnoblearmor, 140, 'noble armor')
shopModule:addSellableItem({'crown armor'}, 					Cfcrownarmor, 210)
shopModule:addSellableItem({'crown legs'}, 					Cfcrownlegs, 60)
shopModule:addSellableItem({'dark armor'}, 					Cfdarkarmor, 130)
shopModule:addSellableItem({'dark helmet'}, 					Cfdarkhelmet, 40)
shopModule:addSellableItem({'crown helmet'}, 					Cfcrownhelmet, 70)
shopModule:addSellableItem({'dragon scale mail'}, 					Cfdragonscalemail, 280)
shopModule:addSellableItem({'demon helmet'}, 					Cfdemonhelmet, 95)
shopModule:addSellableItem({'demon armor'}, 					Cfdemonarmor, 195)
shopModule:addSellableItem({'demon legs'}, 					Cfdemonlegs, 84)
shopModule:addSellableItem({'horned helmet'}, 					Cfhornedhelmet, 155)
shopModule:addSellableItem({'steel shield'}, 					Cfsteelshield, 30)
shopModule:addSellableItem({'plate shield'}, 					Cfplateshield, 25)
shopModule:addSellableItem({'brass shield'}, 					Cfbrassshield, 15)
shopModule:addSellableItem({'wooden shield'}, 					Cfwoodenshield, 1)
shopModule:addSellableItem({'battle shield'}, 					Cfbattleshield, 50)
shopModule:addSellableItem({'mastermind shield'}, 					Cfmastermindshield, 550)
shopModule:addSellableItem({'guardian shield'}, 					Cfguardianshield, 150)
shopModule:addSellableItem({'dragon shield'}, 					Cfdragonshield, 115)
shopModule:addSellableItem({'beholder shield'}, 					Cfbeholdershield, 79)
shopModule:addSellableItem({'crown shield'}, 					Cfcrownshield, 109)
shopModule:addSellableItem({'demon shield'}, 					Cfdemonshield, 130)
shopModule:addSellableItem({'dark shield'}, 					Cfdarkshield, 60)
shopModule:addSellableItem({'great shield'}, 					Cfgreatshield, 480)
shopModule:addSellableItem({'blessed shield'}, 					Cfblessedshield, 650)
shopModule:addSellableItem({'ornamented shield'}, 					Cfornamentedshield, 45)
shopModule:addSellableItem({'dwarven shield'}, 					Cfdwarvenshield, 55)
shopModule:addSellableItem({'studded shield'}, 					Cfstuddedshield, 2)
shopModule:addSellableItem({'rose shield'}, 					Cfroseshield, 49)
shopModule:addSellableItem({'tower shield'}, 					Cftowershield, 90)
shopModule:addSellableItem({'black shield'}, 					Cfblackshield, 5)
shopModule:addSellableItem({'copper shield'}, 					Cfcoppershield, 10)
shopModule:addSellableItem({'viking shield'}, 					Cfvikingshield, 35)
shopModule:addSellableItem({'ancient shield'}, 					Cfancientshield, 49)
shopModule:addSellableItem({'griffin shield'}, 					Cfgriffinshield, 59)
shopModule:addSellableItem({'vampire shield'}, 					Cfvampireshield, 119)


shopModule:addSellableItem({'sword'}, 					Cfsword, 7)
shopModule:addSellableItem({'axe'}, 					Cfaxe, 6)
shopModule:addSellableItem({'club'}, 					Cfclub, 1)
shopModule:addSellableItem({'mace'}, 					Cfmace, 8)
shopModule:addSellableItem({'dagger'}, 					Cfdagger, 1)
shopModule:addSellableItem({'halberd'}, 					Cfhalberd, 50)
shopModule:addSellableItem({'plate armor'}, 					Cfplatearmor, 110)

keywordHandler:addKeyword({'job'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I buy all kinds of armory and weapons."})
keywordHandler:addKeyword({'name'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Won't tell you."})
keywordHandler:addKeyword({'h.l'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "That's me."})
keywordHandler:addKeyword({'snake eye'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Boss of the tavern. He's alright."})
keywordHandler:addKeyword({'boss'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Snake Eye isn't my boss."})
keywordHandler:addKeyword({'tavern'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Drink and eat there. What else do you do in a tavern!"})
keywordHandler:addKeyword({'brat'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah. Women are not good for fighting. I don't need them. And I don't like them."})
keywordHandler:addKeyword({'women'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah. Women are not good for fighting. I don't need them. And I don't like them."})
keywordHandler:addKeyword({'woman'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Bah. Women are not good for fighting. I don't need them. And I don't like them."})
keywordHandler:addKeyword({'god'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget the gods"})
keywordHandler:addKeyword({'durin'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget Durin. He's the worst anyway."})
keywordHandler:addKeyword({'steve'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget Steve."})
keywordHandler:addKeyword({'guido'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget Guido."})
keywordHandler:addKeyword({'stephan'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget Stephan."})
keywordHandler:addKeyword({'cip'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Forget about Cip."})
keywordHandler:addKeyword({'tibia'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia. At least there's one good place in Tibia. Here!"})
keywordHandler:addKeyword({'thais'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ha! Thais. I lived there. You know, I was in the royal army. But it's all wrong. I deserted."})
keywordHandler:addKeyword({'royal army'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good fighter training. But for the wrong cause."})
keywordHandler:addKeyword({'training'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes. Good training."})
keywordHandler:addKeyword({'cause'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Don't want to talk about it."})
keywordHandler:addKeyword({'kazordoon'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Dwarfs are good people. I like them."})
keywordHandler:addKeyword({'dwarf'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I like them."})
keywordHandler:addKeyword({"ab'dendriel"}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Elves. Hate them."})
keywordHandler:addKeyword({'edron'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Might be a good place to live. But I'm afraid that the people are Thais friendly."})
keywordHandler:addKeyword({'king'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The king should be dead."})
keywordHandler:addKeyword({'ruler'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Tibia doesn't need a ruler."})
keywordHandler:addKeyword({'tibianus'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Hang him."})
keywordHandler:addKeyword({'wild warior'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yeah. I'm a wild warrior. Well, to be honest, I left them. They became too aggressive. Attacking everyone is not good."})
keywordHandler:addKeyword({'camp'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Most people in the camp are no wild warriors."})
keywordHandler:addKeyword({'hideout'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I left the wild warriors, while we - well - they planned a new hideout."})
keywordHandler:addKeyword({'hid'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Wild warriors have always something to hide."})
keywordHandler:addKeyword({'new'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "It's somewhere in the woods, of course. I don't know where."})
keywordHandler:addKeyword({'wood'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "The woods are good to hide."})
keywordHandler:addKeyword({'traps'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Be careful out there."})
keywordHandler:addKeyword({'collapsed'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Yes. That's why we - well - they planned a new hideout. But I think they left the vault in the old hideout."})
keywordHandler:addKeyword({'vault'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Good stuff in there, I think."})
keywordHandler:addKeyword({'stuff'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "Ahm. I don't know what it is. Sorry."})
keywordHandler:addKeyword({'sell'}, StdModule.say, {npcHandler = npcHandler, onlyFocus = true, text = "I buy nearly everything. Just ask."})

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:addModule(FocusModule:new())