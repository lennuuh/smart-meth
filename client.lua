ESX = exports["es_extended"]:getSharedObject()

exports.ox_target:addBoxZone({
    coords = vector3(978.19, -147.3, -48.3),
    size = vector3(1.0, 1.0, 1.0),
    options = {
        {
            name = "l_keitä",
            icon = 'fa-solid fa-flask',
            label = 'Boil meth',
            onSelect = function(data)
                if lib.skillCheck({'easy', 'easy', 'medium'}, {'1', '2', '3'}) then
                    lib.progressBar(data)

                    if lib.progressCircle({
                        duration = 20000,
                        position = 'bottom',
                        label = "Boiling meth...",
                        useWhileDead = false,
                        canCancel = true,
                        disable = {
                            car = true,
                            move = true,
                            combat = true
                        },
                        anim = {
                            dict = "weapons@misc@jerrycan@",
                            clip = "fire"
                        }
                    }) then
                        TriggerServerEvent('L_Annaitemi', 'boiledmeth', 1)
                        
                    else
                        lib.notify({
                            title = 'Meth',
                            description = 'You stopped boiling meth ',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = 'Meth',
                        description = 'You failed, try again!',
                        type = 'error'
                    })
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(988.8, -140.6, -49.0070),
    size = vector3(1.0, 1.0, 1.0),
    options = {
        {
            name = "l_murskaus",
            icon = 'fa-solid fa-gavel',
            label = 'Crush meth',
            onSelect = function(data)
                local itemCount = exports.ox_inventory:GetItemCount('boiledmeth')
                
                if itemCount > 0 then
                    if lib.skillCheck({'easy', 'medium'}, {'1', '2'}) then
                        TriggerServerEvent('L_Poistaitemi', 'boiledmeth', 1)  
                        TriggerServerEvent('L_Annaitemi', 'crushedmeth', 1) 
                    else
                        lib.notify({
                            title = 'Meth',
                            description = 'You failed, try again!',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = 'Meth',
                        description = 'You need boiled meth to start!',
                        type = 'error'
                    })
                end
            end
        }
    }
})

exports.ox_target:addBoxZone({
    coords = vector3(986.65, -140.7, -49.0),
    size = vector3(1.0, 1.0, 1.0),
    options = {
        {
            name = "l_pussitus",
            icon = "fa fa-shopping-bag",
            label = "Bag meth",
            onSelect = function(data)
                local itemCount = exports.ox_inventory:GetItemCount('crushedmeth')

                if itemCount > 0 then
                    if lib.skillCheck({'easy', 'easy'}, {'1', '2'}) then
                        lib.progressBar(data)
                        if lib.progressCircle({
                            duration = 15000,
                            position = 'bottom',
                            label = "Bagging meth...",
                            useWhileDead = false,
                            canCancel = true,
                            disable = {
                                car = true,
                                move = true,
                                combat = true
                            },
                            anim = {
                              dict = "anim@amb@business@coc@coc_unpack_cut_left@",
                              clip = "coke_cut_v5_coccutter"
                            }
                        }) then
                            TriggerServerEvent('L_Poistaitemi', 'crushedmeth', 1) 
                            TriggerServerEvent('L_Annaitemi', 'meth', 1)
                        else
                            lib.notify({
                                title = 'Meth',
                                description = 'You stopped bagging the meth',
                                type = 'error'
                            })
                        end
                    else
                        lib.notify({
                            title = 'Meth',
                            description = 'You failed, try again!',
                            type = 'error'
                        })
                    end
                else
                    lib.notify({
                        title = 'Meth',
                        description = 'You need crushed meth to start!',
                        type = 'error'
                    })
                end
            end
        }
    }
})

