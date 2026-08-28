# Nova Jobs

Modular job resource for Nova-Core.

## Install

Put this folder in:

resources/[nova]/nova-jobs

Then add:

ensure nova-core
ensure nova-jobs

Nova Core must start before Nova Jobs.

## Commands

/player:
- `/job` - display current job
- `/duty` - toggle duty
- `/myjob` - client job display

/server console:
- `setjob [playerId] [job] [grade]`

Examples:

setjob 1 police 2
setjob 1 ambulance 1
setjob 1 mechanic 3
setjob 1 unemployed 0

## Included jobs

Police:
0 Recruit
1 Officer
2 Sergeant
3 Lieutenant
4 Chief

EMS:
0 Trainee
1 Paramedic
2 Doctor
3 Chief

Mechanic:
0 Apprentice
1 Mechanic
2 Senior Mechanic
3 Shop Manager

Unemployed:
0 Civilian

## Features

- Modular files
- Job definitions
- Grades
- Salaries
- Duty system
- Paychecks
- Client/server events
- Exports
- SQL schema
- Nova-Core integration

## Note about persistence

The included SQL creates job tables, but the Nova-Core player persistence must save the player's current job fields. The Nova-Core supplied previously already has job fields in `nova_players`. Make sure its database save function is updated when changing jobs if you want job changes to survive a server restart.
