# Nova Spawn

Custom spawn selector for Nova RP.

## Dependencies

- nova-core
- nova-identity (recommended)

## Install

Put this folder at:

resources/[nova]/nova-spawn

Then add:

ensure oxmysql
ensure nova-core
ensure nova-identity
ensure nova-spawn

## Commands

`/spawn` opens the spawn selector.

The selector also opens automatically after Nova Identity selects a character when:

OpenAfterIdentity = true

## Included locations

- Legion Square
- Pillbox Hill
- Sandy Shores
- Paleto Bay

Edit `config.lua` to add, remove, or change spawn locations.

## Exports

Client:

exports['nova-spawn']:OpenSpawnSelector()

exports['nova-spawn']:SpawnAt('legion')

## NUI

The HTML interface is contained inside:

html/index.html
html/style.css
html/app.js

## Notes

This is a lightweight spawn selector foundation. It intentionally does not replace GTA's complete spawnmanager or add a vehicle/house/job-specific spawn system.
