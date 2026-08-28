# Nova Identity

Character identity/selection resource for Nova-Core.

## Dependencies

- `nova-core`
- `oxmysql`

## Install

Place the resource at:

resources/[nova]/nova-identity

Start it after the core and oxmysql:

ensure oxmysql
ensure nova-core
ensure nova-identity

Import:

sql/nova_identity.sql

## Commands

`/identity` or `/characters` opens the character selector.

`/id` prints the selected character to the client console.

## Features

- Character creation
- Character selection
- Character deletion
- First name
- Last name
- Date of birth
- Gender
- Height
- Character limit
- MySQL persistence
- NUI interface
- Client/server separation
- Export for current character

## Important

This is designed as a foundation for Nova RP. It does not include a full appearance editor, multicharacter spawn cameras, clothing, or character customization. Those can be separate Nova resources.
