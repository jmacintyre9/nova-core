NovaSpawn.Camera = nil

function NovaSpawn.CreatePreviewCamera(spawn)
    if not spawn or not spawn.coords then return end

    local c = spawn.coords

    if DoesCamExist(NovaSpawn.Camera) then
        DestroyCam(NovaSpawn.Camera, false)
    end

    NovaSpawn.Camera = CreateCam('DEFAULT_SCRIPTED_CAMERA', true)

    SetCamCoord(NovaSpawn.Camera, c.x + 8.0, c.y + 8.0, c.z + 8.0)
    PointCamAtCoord(NovaSpawn.Camera, c.x, c.y, c.z)

    SetCamActive(NovaSpawn.Camera, true)
    RenderScriptCams(true, true, 500, true, true)
end

function NovaSpawn.DestroyPreviewCamera()
    if DoesCamExist(NovaSpawn.Camera) then
        RenderScriptCams(false, true, 500, true, true)
        DestroyCam(NovaSpawn.Camera, false)
        NovaSpawn.Camera = nil
    end
end
