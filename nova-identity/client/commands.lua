RegisterCommand('id', function()
    if NovaIdentityClient.Current then
        local c = NovaIdentityClient.Current
        print(('Character: %s %s | DOB: %s | Gender: %s | Height: %scm'):format(
            c.firstname, c.lastname, c.dateofbirth, c.gender, c.height
        ))
    else
        print('No character selected.')
    end
end, false)
