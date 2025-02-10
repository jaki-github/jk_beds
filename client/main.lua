Citizen.CreateThread(function()
    for _, bed in pairs(Config.AllBeds.beds) do
        exports.ox_target:addBoxZone({
            coords = bed.loc.xyz,
            size = bed.size,
            rotation = bed.loc.w,
            debug = Config.Debug,
            options = { {
                distance = 2.5,
                label = bed.label,
                icon = bed.icon,
                onSelect = function()
                    TriggerEvent('jk_beds:client:useBed', bed)
                end
            } }
        })
    end
end)

RegisterNetEvent('jk_beds:client:useBed', function(bed)
    local ped = PlayerPedId()

    RequestAnimDict(bed.dicname)
    while not HasAnimDictLoaded(bed.dicname) do
        Wait(100)
    end
    
    SetEntityCoords(ped, bed.loc.x, bed.loc.y, bed.loc.z)
    SetEntityHeading(ped, bed.loc.w)
    TaskPlayAnim(ped, bed.dicname, bed.name, 8.0, -8.0, -1, 1, 0, false, false, false)
    
    lib.showTextUI(Config.TextUI)
    
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if IsControlJustReleased(0, 38) then
                ClearPedTasksImmediately(ped)
                lib.hideTextUI()
                break
            end
        end
    end)
end)