local specialQuests = {
	[30002] = 30002, --Annih
	[30009] = 1010, --Svargrond
	[30010] = 1011, --Svargrond
	[30011] = 1012, --Svargrond
	[30039] = 1022,
	[31248] = 1079 --Dreamer Challenge Quest
}

local quests = {
	[31286] = {storageKey = 2012, storageValue = 2}, -- Postman mission 8
	[31287] = {storageKey = 2013, storageValue = 2}, -- Postman mission 9
	[31289] = {storageKey = 2009, storageValue = 2} -- Postman mission 5
}

function onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local storage = specialQuests[item.actionid]
	if not storage then
		storage = item.uid
		if storage > 65535 then
			return false
		end
	end

	if player:getStorageValue(storage) > 0 then
		player:sendTextMessage(MESSAGE_INFO_DESCR, 'The ' .. ItemType(item.itemid):getName() .. ' is empty.')
		return true
	end

	local targetItem = item
	local items = {}
	local reward = nil

	local size = targetItem:isContainer() and Container(item.uid):getSize() or 0
	if size == 0 then
		reward = targetItem:clone()
	else
		local container = Container(item.uid)
		for i = 0, container:getSize() - 1 do
			items[#items + 1] = container:getItem(i):clone()
		end
	end

	size = #items
	if size == 1 then
		reward = items[1]:clone()
	end

	local result = ''
	local weight = 0
	if reward then
		local ret = ItemType(reward:getId())
		if ret:isRune() then
			result = ret:getArticle() .. ' ' ..  ret:getName() .. ' (' .. reward:getSubType() .. ' charges)'
		elseif ret:isStackable() and reward:getCount() > 1 then
			result = reward:getCount() .. ' ' .. ret:getPluralName()
		else
			result = ret:getArticle() .. ' ' .. ret:getName()
		end
		weight = weight + ret:getWeight(reward:getCount())
	else
		if size > 20 then
			reward = Game.createItem(item.itemid, 1)
		elseif size > 8 then
			reward = Game.createItem(1988, 1)
		else
			reward = Game.createItem(1987, 1)
		end

		for i = 1, size do
			local tmp = items[i]
			if reward:addItemEx(tmp) ~= RETURNVALUE_NOERROR then
				print('[Warning] QuestSystem:', 'Could not add quest reward to container')
			else
				local ret = ', '
				if i == size then
					ret = ' and '
				elseif i == 1 then
					ret = ''
				end
				result = result .. ret

				local ret = ItemType(tmp:getId())
				if ret:isRune() then
					result = result .. ret:getArticle() .. ' ' .. ret:getName() .. ' (' .. tmp:getSubType() .. ' charges)'
				elseif ret:isStackable() and tmp:getCount() > 1 then
					result = result .. tmp:getCount() .. ' ' .. ret:getPluralName()
				else
					result = result .. ret:getArticle() .. ' ' .. ret:getName()
				end
				weight = weight + ret:getWeight(tmp:getCount())
			end
		end
		weight = weight + ItemType(reward:getId()):getWeight()
	end

	if player:addItemEx(reward) ~= RETURNVALUE_NOERROR then
		local weight = reward:getWeight()
		if player:getFreeCapacity() < weight then
			player:sendCancelMessage(string.format('You have found %s weighing %.2f oz. You have no capacity.', result, (weight / 100)))
		else
			player:sendCancelMessage('You have found ' .. result .. ', but you have no room to take it.')
		end
		return true
	end

	local targetTable = quests[item.uid]
	if targetTable then
		player:setStorageValue(targetTable.storageKey, targetTable.storageValue)
	end			 

	player:sendTextMessage(MESSAGE_INFO_DESCR, 'You have found ' .. result .. '.')
	player:setStorageValue(storage, 1)
	return true
end