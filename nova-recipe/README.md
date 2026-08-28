# Nova RP Recipe-Based FiveM Server

A custom txAdmin/FiveM recipe template for building a modular Nova RP server.

## Installation

1. Open txAdmin.
2. Create a new server using the recipe/deployment flow.
3. Import `recipe.yaml`.
4. Change the placeholder GitHub repositories to your own repositories.
5. Configure the generated `server.cfg`.
6. Import `sql/nova.sql`.
7. Add your FiveM license key.
8. Add your administrator license to `permissions.cfg`.

## Important

The repository URLs in recipe.yaml are placeholders. They must point to actual GitHub repositories containing your Nova resources before txAdmin can download them.

This package is a server template/recipe and does not pretend to contain third-party resources that have not been supplied.
