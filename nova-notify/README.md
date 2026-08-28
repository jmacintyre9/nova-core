# Nova Notify

Custom notification system for Nova RP.

## Install

Place this folder at:

resources/[nova]/nova-notify

Add to server.cfg:

ensure nova-notify

## Usage

Client Lua:

exports['nova-notify']:Notify('Hello!', 'info')
exports['nova-notify']:Notify('Saved successfully.', 'success')
exports['nova-notify']:Notify('Be careful.', 'warning')
exports['nova-notify']:Notify('Something went wrong.', 'error')

Optional duration:

exports['nova-notify']:Notify('Message', 'info', 8000)

Clear all:

exports['nova-notify']:Clear()

## Server -> client

TriggerClientEvent(
    'nova-notify:client:notify',
    playerId,
    'Hello from the server!',
    'success',
    5000
)

## Test

Use:

/testnotify

Or:

/notify hello world

## Configuration

Edit config.lua for:

- position
- duration
- maximum visible notifications
- notification labels
- notification icons

## Supported positions

- top-right
- top-left
- bottom-right
- bottom-left
- center
