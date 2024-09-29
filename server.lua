ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent('L_Poistaitemi')
AddEventHandler('L_Poistaitemi', function(itemName, count)
    local playerId = source
    local xPlayer = ESX.GetPlayerFromId(playerId)

    if xPlayer then
        local success, response = exports.ox_inventory:RemoveItem(playerId, itemName, count)
    end
end)

RegisterNetEvent('L_Annaitemi')
AddEventHandler('L_Annaitemi', function(itemName, amount)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer then
        xPlayer.addInventoryItem(itemName, amount)

        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Meth',
            description = 'You got ' .. amount .. ' ' .. itemName,
            type = 'success'
        })
    else
    end
end)