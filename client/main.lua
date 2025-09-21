SetRelationshipBetweenGroups(3, `AMBIENT_GANG_HILLBILLY`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_BALLAS`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MEXICAN`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_FAMILY`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_MARABUNTE`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_SALVA`, `PLAYER`)
SetRelationshipBetweenGroups(3, `AMBIENT_GANG_LOST`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_1`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_2`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_9`, `PLAYER`)
SetRelationshipBetweenGroups(3, `GANG_10`, `PLAYER`)
SetRelationshipBetweenGroups(3, `FIREMAN`, `PLAYER`)
SetRelationshipBetweenGroups(3, `MEDIC`, `PLAYER`)
SetRelationshipBetweenGroups(3, `COP`, `PLAYER`)
SetRelationshipBetweenGroups(3, `PRISONER`, `PLAYER`)

local density = lib.load('config.client')

local function setDensity(type, value)
    if type == 'parked' then
        density.parked = value
    elseif type == 'vehicle' then
        density.vehicle = value
    elseif type == 'randomvehicles' then
        density.randomvehicles = value
    elseif type == 'peds' then
        density.peds = value
    elseif type == 'scenario' then
        density.scenario = value
    end
end

exports('SetDensity', setDensity)

CreateThread(function()
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(density.parked)
        SetVehicleDensityMultiplierThisFrame(density.vehicle)
        SetRandomVehicleDensityMultiplierThisFrame(density.randomvehicles)
        SetPedDensityMultiplierThisFrame(density.peds)
        SetScenarioPedDensityMultiplierThisFrame(density.scenario, density.scenario) -- Walking NPC Density
        Wait(0)
    end
end)
