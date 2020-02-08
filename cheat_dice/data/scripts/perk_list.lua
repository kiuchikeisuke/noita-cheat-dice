dofile_once("mods/cheat_dice/config.lua")

for _, perk in ipairs(perk_list) do
	if perk.id == "PERKS_LOTTERY" then
    local value = PerkDestoryChance
		if value < 0 then
			value = 0
		end
		if value > 100 then
			value = 100
		end
		local percent = 100 - value
		perk.ui_description = "When you pick a perk, there's a "..percent.."% chance the others won't disappear."
		perk.func = function(entity_perk_item, entity_who_picked, item_name)
			local perk_destroy_chance = tonumber( GlobalsGetValue( "TEMPLE_PERK_DESTROY_CHANCE", "100" ) )
			perk_destroy_chance = perk_destroy_chance * value * 0.01
			GlobalsSetValue( "TEMPLE_PERK_DESTROY_CHANCE", to_string(perk_destroy_chance) )
		end
	end
end
