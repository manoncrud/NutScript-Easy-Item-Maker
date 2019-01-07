concommand.Add( "ns_generateWeaponFile", function (ply, cmd, args ) 
    local activeWeapon = LocalPlayer():GetActiveWeapon()
    local weaponClass = (activeWeapon:GetClass())--Weapon code name
    local weaponPrintName = (activeWeapon:GetPrintName())--Gay weapon print name
    local weaponModel = (activeWeapon:GetModel())
    local weaponPurpose = (activeWeapon.Purpose)
    local weaponInstructions = (activeWeapon.Instructions)
    local weaponFiltered = string.lower(weaponClass)
    local weaponFiltered = weaponFiltered:gsub('tfa_', '')--Removes the tfa_ part of the weapon
    local weaponFiltered = weaponFiltered:gsub('[%p%c%s]', '')--Removes capital letters, underscores, etc.
    local weaponFiltered = weaponFiltered:gsub('nmrih', '')--This was just for me personally since I use the NMRIH weapon pack. Comment this out if u don't need it
----------------------------------------------------------------
----------------------------------------------------------------
    local itemName = ("ITEM.name = \"" ..weaponPrintName .."\"")
    local itemClass = ("ITEM.class = \"" ..weaponClass .."\"")
    local itemModel = ("ITEM.model = \"" ..weaponModel .."\"")
    local itemDesc = ("ITEM.desc = \"" ..weaponPurpose .."\"")
    local itemHolsterInfo = ("ITEM.holsterDrawInfo = {}")
    local itemMelee = ("ITEM.weaponCategory = \"melee\"" .."\n" .."ITEM.width = 1" .."\n" .."ITEM.height = 2")
    local itemSecondary = ("ITEM.weaponCategory = \"secondary\"" .."\n" .."ITEM.width = 2" .."\n" .."ITEM.height = 2")
    local itemPrimary = ("ITEM.weaponCategory = \"primary\"" .."\n" .."ITEM.width = 3" .."\n" .."ITEM.height = 2")


    local weaponDataMelee = (itemName .."\n" ..itemClass .."\n" ..itemModel .."\n" ..itemDesc .."\n" ..itemHolsterInfo .."\n" ..itemMelee)
    local weaponDataSecondary = (itemName .."\n" ..itemClass .."\n" ..itemModel .."\n" ..itemDesc .."\n" ..itemSecondary .."\n")
    local weaponDataPrimary = (itemName .."\n" ..itemClass .."\n" ..itemModel .."\n" ..itemDesc .."\n"..itemPrimary .."\n" ..itemHolsterInfo)

  	local slot = (activeWeapon:GetSlot() + 1)--Slot number starts at 0 for some fucking reason.

  	if slot != 2 then
  		file.Write( "sh_" ..weaponFiltered ..".txt", weaponDataMelee)
    elseif slot == 2 then
    	file.Write( "sh_" ..weaponFiltered ..".txt", weaponDataSecondary)
    else
    	file.Write( "sh_" ..weaponFiltered ..".txt", weaponDataPrimary)
    end

    LocalPlayer():ChatPrint("Item Made For " .. weaponPrintName)

end )



