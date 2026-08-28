# Nova Admin

Modular FiveM administration resource for Nova RP.

## Install

Put this folder at:

resources/[nova]/nova-admin

Then:

ensure nova-core
ensure nova-notify
ensure nova-admin

## ACE permissions

Add to your permissions.cfg:

add_ace group.admin nova.admin allow
add_principal identifier.license:YOUR_LICENSE group.admin

Replace YOUR_LICENSE with your actual FiveM license identifier.

## Commands

`/admin` - open admin menu

`/kick [id] [reason]`
`/freeze [id]`
`/bring [id]`
`/goto [id]`
`/announce [message]`

The UI also provides player actions for:
- Heal
- Revive
- Freeze
- Kick

## Security

All important server-side actions check the `nova.admin` ACE permission. Do not trust client-side permissions for administrative actions.

## Files

- server/main.lua - core admin functions
- server/permissions.lua - ACE documentation
- server/commands.lua - admin commands
- server/player.lua - player actions
- client/main.lua - client bootstrap
- client/menu.lua - NUI callbacks/menu
- client/actions.lua - player actions
- html/* - admin interface

## Note

This is a foundation admin system. Ban persistence, warnings, staff duty, spectating, teleport coordinates, vehicle tools, reports, logs and database-backed punishments can be added as separate Nova resources.
