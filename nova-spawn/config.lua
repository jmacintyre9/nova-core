NovaSpawnConfig = {
    CoreResource = 'nova-core',
    IdentityResource = 'nova-identity',

    -- Show the spawn selector after character selection.
    OpenAfterIdentity = true,

    -- Hide the GTA radar while choosing a spawn.
    HideRadar = true,

    -- Default spawn locations.
    Spawns = {
        {
            id = 'legion',
            label = 'Legion Square',
            description = 'Downtown Los Santos',
            coords = vector4(215.76, -810.12, 30.73, 158.0)
        },
        {
            id = 'pillbox',
            label = 'Pillbox Hill',
            description = 'Pillbox Medical Center area',
            coords = vector4(298.62, -584.52, 43.26, 70.0)
        },
        {
            id = 'sandy',
            label = 'Sandy Shores',
            description = 'Sandy Shores town',
            coords = vector4(1737.72, 3708.85, 34.14, 20.0)
        },
        {
            id = 'paleto',
            label = 'Paleto Bay',
            description = 'Paleto Bay town',
            coords = vector4(-104.55, 6327.34, 31.58, 45.0)
        }
    }
}
