NovaIdentity = NovaIdentity or {}
NovaIdentity.Active = {}

local function clean(value, maxLength)
    value = tostring(value or ''):gsub('[<>]', '')
    return value:sub(1, maxLength)
end

local function validGender(gender)
    return gender == 'male' or gender == 'female' or gender == 'other'
end

local function validate(data)
    data.firstname = clean(data.firstname, 30)
    data.lastname = clean(data.lastname, 30)
    data.dateofbirth = clean(data.dateofbirth, 10)
    data.gender = clean(data.gender, 10)
    data.height = tonumber(data.height) or 180

    if #data.firstname < 2 or #data.lastname < 2 then
        return false, 'First and last name must be at least 2 characters.'
    end

    if #data.dateofbirth < 8 or #data.dateofbirth > 10 then
        return false, 'Invalid date of birth.'
    end

    if not validGender(data.gender) then
        return false, 'Invalid gender.'
    end

    if data.height < 120 or data.height > 230 then
        return false, 'Height must be between 120 and 230 cm.'
    end

    return true
end

RegisterNetEvent('nova-identity:server:requestCharacters', function()
    local src = source
    local identifier = NovaIdentity.GetIdentifier(src)

    if not identifier then return end

    local characters = NovaIdentity.GetCharacters(identifier)
    TriggerClientEvent('nova-identity:client:characters', src, characters)
end)

RegisterNetEvent('nova-identity:server:createCharacter', function(data)
    local src = source
    local identifier = NovaIdentity.GetIdentifier(src)

    if not identifier or type(data) ~= 'table' then return end

    local characters = NovaIdentity.GetCharacters(identifier)

    if #characters >= NovaIdentityConfig.MaxCharacters then
        TriggerClientEvent('nova-identity:client:error', src, 'You have reached the character limit.')
        return
    end

    local valid, reason = validate(data)
    if not valid then
        TriggerClientEvent('nova-identity:client:error', src, reason)
        return
    end

    local id = NovaIdentity.CreateCharacter(identifier, data)

    if not id then
        TriggerClientEvent('nova-identity:client:error', src, 'Character creation failed.')
        return
    end

    local character = NovaIdentity.GetCharacter(id, identifier)
    NovaIdentity.Active[src] = character

    TriggerClientEvent('nova-identity:client:characterSelected', src, character)
end)

RegisterNetEvent('nova-identity:server:selectCharacter', function(characterId)
    local src = source
    local identifier = NovaIdentity.GetIdentifier(src)
    characterId = tonumber(characterId)

    if not identifier or not characterId then return end

    local character = NovaIdentity.GetCharacter(characterId, identifier)

    if not character then
        TriggerClientEvent('nova-identity:client:error', src, 'Character not found.')
        return
    end

    NovaIdentity.Active[src] = character
    TriggerClientEvent('nova-identity:client:characterSelected', src, character)
end)

RegisterNetEvent('nova-identity:server:deleteCharacter', function(characterId)
    local src = source
    local identifier = NovaIdentity.GetIdentifier(src)
    characterId = tonumber(characterId)

    if not identifier or not characterId then return end

    NovaIdentity.DeleteCharacter(characterId, identifier)
    TriggerClientEvent('nova-identity:client:characters', src, NovaIdentity.GetCharacters(identifier))
end)

AddEventHandler('playerDropped', function()
    NovaIdentity.Active[source] = nil
end)

exports('GetCharacter', function(src)
    return NovaIdentity.Active[tonumber(src)]
end)
