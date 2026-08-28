NovaIdentity = NovaIdentity or {}

function NovaIdentity.GetIdentifier(src)
    for _, identifier in ipairs(GetPlayerIdentifiers(src)) do
        if identifier:sub(1, 8) == 'license:' then
            return identifier
        end
    end
    return GetPlayerIdentifiers(src)[1]
end

function NovaIdentity.GetCharacters(identifier)
    return MySQL.query.await(
        'SELECT * FROM nova_characters WHERE identifier = ? ORDER BY id ASC',
        { identifier }
    )
end

function NovaIdentity.GetCharacter(characterId, identifier)
    return MySQL.single.await(
        'SELECT * FROM nova_characters WHERE id = ? AND identifier = ?',
        { characterId, identifier }
    )
end

function NovaIdentity.CreateCharacter(identifier, data)
    return MySQL.insert.await([[
        INSERT INTO nova_characters
        (identifier, firstname, lastname, dateofbirth, gender, height)
        VALUES (?, ?, ?, ?, ?, ?)
    ]], {
        identifier,
        data.firstname,
        data.lastname,
        data.dateofbirth,
        data.gender,
        data.height
    })
end

function NovaIdentity.DeleteCharacter(characterId, identifier)
    return MySQL.update.await(
        'DELETE FROM nova_characters WHERE id = ? AND identifier = ?',
        { characterId, identifier }
    )
end
