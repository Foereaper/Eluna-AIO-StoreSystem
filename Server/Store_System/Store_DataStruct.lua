local ServiceData = {}
local LinkData = {}
local NavData = {}
local CurrencyData = {}
local CreatureDisplays = {}

local KEYS = {
	currency = {
		id				= 0,
		currencyType	= 1,
		name			= 2,
		icon			= 3,
		data			= 4,
		tooltip			= 5
	},
	category = {
		id				= 1,
		name			= 2,
		icon			= 3,
		requiredRank	= 4,
		flags			= 5,
		enabled			= 6
	},
	service = {
		id				= 0,
		serviceType		= 1,
		name			= 2,
		tooltipName		= 3,
		tooltipType		= 4,
		tooltipText		= 5,
		icon			= 6,
		price			= 7,
		currency		= 8,
		hyperlink		= 9,
		displayOrEntry	= 10,
		discount		= 11,
		flags			= 12,
		reward_1		= 13,
		reward_2		= 14,
		reward_3		= 15,
		reward_4		= 16,
		reward_5		= 17,
		reward_6		= 18,
		reward_7		= 19,
		reward_8		= 20,
		rewardCount_1	= 21,
		rewardCount_2	= 22,
		rewardCount_3	= 23,
		rewardCount_4	= 24,
		rewardCount_5	= 25,
		rewardCount_6	= 26,
		rewardCount_7	= 27,
		rewardCount_8	= 28,
		new				= 29,
		enabled			= 30
	},
}

function GetDataStructKeys()
	return KEYS;
end

function NavData.Load()
	NavData.Cache = {};
	
	local Query = WorldDBQuery("SELECT * FROM store.store_categories")
	if(Query) then 
		repeat
			table.insert(NavData.Cache, {Query:GetUInt32(KEYS.category.id-1), Query:GetString(KEYS.category.name-1), Query:GetString(KEYS.category.icon-1), Query:GetUInt32(KEYS.category.requiredRank-1), Query:GetUInt32(KEYS.category.flags-1), Query:GetUInt32(KEYS.category.enabled-1)}) 
		until not Query:NextRow()
	end
end

function CurrencyData.Load()
	CurrencyData.Cache = {};
	
	local Query = WorldDBQuery("SELECT * FROM store.store_currencies")
	if(Query) then 
		repeat
			CurrencyData.Cache[Query:GetUInt32(0)] = { -- id
				Query:GetUInt32(1), -- type
				Query:GetString(2), -- name
				Query:GetString(3), -- icon
				Query:GetUInt32(4), -- data
				Query:GetString(5), -- tooltip
			}
		until not Query:NextRow()
	end
end

function ServiceData.Load()
	ServiceData.Cache = {};
	
	local Query = WorldDBQuery("SELECT * FROM store.store_services;");
	if(Query) then
		repeat
			if(Query:GetUInt32(KEYS.service.enabled) == 1) then
				ServiceData.Cache[Query:GetUInt32(KEYS.service.id)] = {
					Query:GetUInt32(KEYS.service.serviceType),
					Query:GetString(KEYS.service.name),
					Query:GetString(KEYS.service.tooltipName),
					Query:GetString(KEYS.service.tooltipType),
					Query:GetString(KEYS.service.tooltipText),
					Query:GetString(KEYS.service.icon),
					Query:GetUInt32(KEYS.service.price),
					Query:GetUInt32(KEYS.service.currency),
					Query:GetUInt32(KEYS.service.hyperlink),
					Query:GetUInt32(KEYS.service.displayOrEntry),
					Query:GetUInt32(KEYS.service.discount),
					Query:GetUInt32(KEYS.service.flags),
					Query:GetUInt32(KEYS.service.reward_1),
					Query:GetUInt32(KEYS.service.reward_2),
					Query:GetUInt32(KEYS.service.reward_3),
					Query:GetUInt32(KEYS.service.reward_4),
					Query:GetUInt32(KEYS.service.reward_5),
					Query:GetUInt32(KEYS.service.reward_6),
					Query:GetUInt32(KEYS.service.reward_7),
					Query:GetUInt32(KEYS.service.reward_8),
					Query:GetUInt32(KEYS.service.rewardCount_1),
					Query:GetUInt32(KEYS.service.rewardCount_2),
					Query:GetUInt32(KEYS.service.rewardCount_3),
					Query:GetUInt32(KEYS.service.rewardCount_4),
					Query:GetUInt32(KEYS.service.rewardCount_5),
					Query:GetUInt32(KEYS.service.rewardCount_6),
					Query:GetUInt32(KEYS.service.rewardCount_7),
					Query:GetUInt32(KEYS.service.rewardCount_8),
					Query:GetUInt32(KEYS.service.new),
				}
			end
		until not Query:NextRow()
	end
end

function CreatureDisplays.Load()
	CreatureDisplays.Cache = {}
	local tmp = ""
	-- fetch all entries for creature cache that needs to be sent to the client for preview
	-- store these as a comma separated string to be used in the sql query below
	for k, v in pairs(ServiceData.Cache) do
		if ((v[KEYS.service.serviceType] == 3 or v[KEYS.service.serviceType] == 4) and v[KEYS.service.displayOrEntry] > 0) then
			-- first entry shouldn't append a comma
			if(tmp ~= "") then
				tmp = tmp .. ", "
			end
			
			-- append creature entry to the query string
			tmp = tmp .. v[KEYS.service.displayOrEntry]
		end
	end
	
	-- get all info and store it in the CreatureDisplays cache
	local Query = WorldDBQuery("SELECT entry, `name`, subname, IconName, type_flags, `type`, family, `rank`, KillCredit1, KillCredit2, modelId1, modelId2, modelId3, modelId4, HealthModifier, ManaModifier, RacialLeader, MovementType FROM creature_template WHERE entry IN ("..tmp..");")
	if(Query) then
		repeat
		table.insert(CreatureDisplays.Cache, 
		{
			Query:GetUInt32(0),
			Query:GetString(1),
			Query:GetString(2),
			Query:GetString(3),
			Query:GetUInt32(4),
			Query:GetUInt32(5),
			Query:GetUInt32(6),
			Query:GetUInt32(7),
			Query:GetUInt32(8),
			Query:GetUInt32(9), 
			Query:GetUInt32(10),
			Query:GetUInt32(11),
			Query:GetUInt32(12),
			Query:GetUInt32(13),
			Query:GetFloat(14),
			Query:GetFloat(15),
			Query:GetUInt32(16),
			Query:GetUInt32(17)
		})
		until not Query:NextRow()
	end
end

function LinkData.Load()
	LinkData.Cache = {};
	
	local Query = WorldDBQuery("SELECT * FROM store.store_category_service_link;");
	if(Query) then
		repeat
			table.insert(LinkData.Cache, {Query:GetUInt32(0), Query:GetUInt32(1)})
		until not Query:NextRow()
	end
end

function GetServiceData()
	return ServiceData.Cache;
end

function GetLinkData()
	return LinkData.Cache;
end

function GetNavData()
	return NavData.Cache;
end

function GetCurrencyData()
	return CurrencyData.Cache;
end

ServiceData.Load()
LinkData.Load()
NavData.Load()
CurrencyData.Load()
CreatureDisplays.Load()

local SoundEffects = {
	notEnoughMoney = {
		[1] = { -- Human
			[0] = 1908,
			[1] = 2032,
		},
		[2] = { -- Orc
			[0] = 2319,
			[1] = 2356,
		},
		[3] = { -- Dwarf
			[0] = 1598,
			[1] = 1669,
		},
		[4] = { -- Night elf
			[0] = 2151,
			[1] = 2262,
		},
		[5] = { -- Undead
			[0] = 2096,
			[1] = 2207,
		},
		[6] = { -- Tauren
			[0] = 2426,
			[1] = 2462,
		},
		[7] = { -- Gnome
			[0] = 1724,
			[1] = 1779,
		},
		[8] = { -- Troll
			[0] = 1835,
			[1] = 1945,
		},
		[10] = { -- Blood elf
			[0] = 9583,
			[1] = 9584,
		},
		[11] = { -- Draenei
			[0] = 9498,
			[1] = 9499,
		}
	},
	cantLearn = {
		[1] = { -- Human
			[0] = 2622,
			[1] = 2585,
		},
		[2] = { -- Orc
			[0] = 2949,
			[1] = 2966,
		},
		[3] = { -- Dwarf
			[0] = 2605,
			[1] = 2893,
		},
		[4] = { -- Night elf
			[0] = 2644,
			[1] = 2661,
		},
		[5] = { -- Undead
			[0] = 2633,
			[1] = 2597,
		},
		[6] = { -- Tauren
			[0] = 2616,
			[1] = 2918,
		},
		[7] = { -- Gnome
			[0] = 2882,
			[1] = 2907,
		},
		[8] = { -- Troll
			[0] = 2611,
			[1] = 2977,
		},
		[10] = { -- Blood elf
			[0] = 9571,
			[1] = 9572,
		},
		[11] = { -- Draenei
			[0] = 9487,
			[1] = 9486,
		}
	},
	cantUse = {
		[1] = { -- Human
			[0] = 1918,
			[1] = 2042,
		},
		[2] = { -- Orc
			[0] = 2329,
			[1] = 2384,
		},
		[3] = { -- Dwarf
			[0] = 1653,
			[1] = 1696,
		},
		[4] = { -- Night elf
			[0] = 2161,
			[1] = 2272,
		},
		[5] = { -- Undead
			[0] = 2106,
			[1] = 2217,
		},
		[6] = { -- Tauren
			[0] = 2483,
			[1] = 2482,
		},
		[7] = { -- Gnome
			[0] = 1753,
			[1] = 1808,
		},
		[8] = { -- Troll
			[0] = 1863,
			[1] = 1987,
		},
		[10] = { -- Blood elf
			[0] = 9611,
			[1] = 9612,
		},
		[11] = { -- Draenei
			[0] = 9535,
			[1] = 9536,
		}
	}
}

function GetSoundEffect(key, race, gender)
	local effect = 0
	if(SoundEffects[key][race][gender]) then
		effect = SoundEffects[key][race][gender]
	end
	return effect
end

local function SendCreatureQueryResponse(player, data)
	local packet = CreatePacket(97, 100)
	packet:WriteULong(data[1])
	packet:WriteString(data[2] or "")
	packet:WriteUByte(0)
	packet:WriteUByte(0)
	packet:WriteUByte(0)
	packet:WriteString(data[3] or "")
	packet:WriteString(data[4] or "")
	packet:WriteULong(data[5])
	packet:WriteULong(data[6])
	packet:WriteULong(data[7])
	packet:WriteULong(data[8])
	packet:WriteULong(data[9])
	packet:WriteULong(data[10])
	packet:WriteULong(data[11])
	packet:WriteULong(data[12])
	packet:WriteULong(data[13])
	packet:WriteULong(data[14])
	packet:WriteFloat(data[15])
	packet:WriteFloat(data[16])
	packet:WriteUByte(data[17])
	packet:WriteULong(0)
	packet:WriteULong(0)
	packet:WriteULong(0)
	packet:WriteULong(0)
	packet:WriteULong(0)
	packet:WriteULong(0)
	packet:WriteULong(data[18])
	player:SendPacket(packet)
end

local function OnLogin(event, player)
	for _, v in pairs(CreatureDisplays.Cache) do
		SendCreatureQueryResponse(player, v)
	end
end

RegisterPlayerEvent(3, OnLogin)