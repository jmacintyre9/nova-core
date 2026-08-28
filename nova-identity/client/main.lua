NovaIdentityClient = {
    Characters = {},
    Current = nil
}

RegisterNetEvent('nova-identity:client:open', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        characters = NovaIdentityClient.Characters
    })

    TriggerServerEvent('nova-identity:server:requestCharacters')
end)

RegisterNetEvent('nova-identity:client:characters', function(characters)
    NovaIdentityClient.Characters = characters or {}

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        characters = NovaIdentityClient.Characters
    })
end)

RegisterNetEvent('nova-identity:client:characterSelected', function(character)
    NovaIdentityClient.Current = character
    SetNuiFocus(false, false)

    SendNUIMessage({ action = 'close' })

    TriggerEvent('nova-identity:client:loaded', character)

    print(('[NOVA-IDENTITY] Selected %s %s'):format(
        character.firstname,
        character.lastname
    ))
end)

RegisterNetEvent('nova-identity:client:error', function(message)
    SendNUIMessage({
        action = 'error',
        message = message
    })
end)

RegisterNUICallback('create', function(data, cb)
    TriggerServerEvent('nova-identity:server:createCharacter', data)
    cb({ ok = true })
end)

RegisterNUICallback('select', function(data, cb)
    TriggerServerEvent('nova-identity:server:selectCharacter', data.id)
    cb({ ok = true })
end)

RegisterNUICallback('delete', function(data, cb)
    TriggerServerEvent('nova-identity:server:deleteCharacter', data.id)
    cb({ ok = true })
end)

RegisterNUICallback('close', function(_, cb)
    SetNuiFocus(false, false)
    SendNUIMessage({ action = 'close' })
    cb({ ok = true })
end)

exports('GetCharacter', function()
    return NovaIdentityClient.Current
end)
