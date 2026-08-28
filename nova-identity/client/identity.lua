CreateThread(function()
    Wait(2500)
    TriggerServerEvent('nova-identity:server:requestCharacters')
end)

RegisterNetEvent('nova-identity:client:loaded', function(character)
    print(('[NOVA-IDENTITY] Welcome %s %s'):format(
        character.firstname,
        character.lastname
    ))
end)
