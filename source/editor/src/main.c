#include "engine.h"
#include <raylib.h>
#include <flecs.h>

int main(void)
{
    SetConfigFlags(FLAG_WINDOW_RESIZABLE);

    InitApplication("Paradox Game Engine - Editor");
    MaximizeWindow();

    ecs_world_t* ecs = ecs_init();

    while (!WindowShouldClose())
    {
        BeginDrawing();

        ecs_progress(ecs, 0);

        DrawFPS(10, 10);
        ClearBackground((Color)
        {
            15, 15, 15, 255
        });
        EndDrawing();
    }

    ecs_quit(ecs);
    CloseWindow();

    return 0;
}