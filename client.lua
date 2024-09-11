local config = require('config')

TriggerEvent('chat:addSuggestion', '/' .. Config.command, 'Scratches serial number off of weapon in hand.', {})

RegisterCommand(Config.command, function()
    local weapontable = exports.ox_inventory:getCurrentWeapon()
    local item = exports.ox_inventory:Search('count', 'dremel')
    if weapontable then
        local weaponName = weapontable.name
        if Config.Guns and tableIncludes(Config.Guns, weaponName) then
            if Config.useitem then
                if item <= 0 then
                TriggerEvent('ox_lib:notify', {
                title = 'You do not have a Dremel to scratch the serial',
                type = 'error',
                duration = 5000,
                position = 'top',
                icon = 'fas fa-exclamation',
                iconColor = '#ff0000',
            })
return
                end
            end

            if lib.progressCircle({
                duration = 7000,
                label = 'Scratching serial',
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'weapons@first_person@aim_lt@p_m_zero@pistol@shared@fidgets@d',
                    clip = 'fidget_low_loop'
                },
            }) then
                TriggerServerEvent('scratch', weapontable.name)
            else
                TriggerEvent('ox_lib:notify', {
                    title = 'Cancelled weapon scratch.',
                    type = 'error',
                    duration = 5000,
                    position = 'top',
                    icon = 'fas fa-exclamation',
                    iconColor = '#ff0000',
                })
            end
        else
        TriggerEvent('ox_lib:notify', {
            title = 'This weapon cannot be scratched.',
            type = 'error',
            duration = 5000,
            position = 'top',
            icon = 'fas fa-exclamation',
            iconColor = '#ff0000',
            })
        end
    else
    TriggerEvent('ox_lib:notify', {
        title = 'You are not holding a weapon',
        type = 'error',
        duration = 5000,
        position = 'top',
        icon = 'fas fa-exclamation',
        iconColor = '#ff0000',
    })
    end
end)
function tableIncludes(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end


