local ESX = exports['es_extended']:getSharedObject()
local config = require('config')

local ox_inventory = exports.ox_inventory

RegisterNetEvent('scratch')
AddEventHandler('scratch', function(weaponName)
    local xPlayer = ESX.GetPlayerFromId(source)
    local weapon = ox_inventory:Search(xPlayer.source, 1, weaponName)

    if weapon and #weapon > 0 then
        local weaponToModify = weapon[1]
        weaponToModify.metadata.serial = Config.metadata 
        ox_inventory:SetMetadata(xPlayer.source, weaponToModify.slot, weaponToModify.metadata)

        
        TriggerClientEvent('ox_lib:notify', source, 
        {
            title = 'Serial scratched',
            duration = 5000,
            position = 'top',
            type = 'success', 
            icon = 'fas fa-gun',  
            iconColor = '#00ff00', 
        })
    else
    TriggerClientEvent('ox_lib:notify', source, {
         title = 'You are not holding a weapon',
         type = 'error', 
          duration = 5000,  
         position = 'top-right', 
         icon = 'fas fa-times-circle',  
          iconColor = '#ff0000',  
        })     
     end
end)

