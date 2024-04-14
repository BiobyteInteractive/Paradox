#include "engine.hpp"

#include <raylib.h>
#define RAYGUI_IMPLEMENTATION
#include "raygui.h"
#include <flecs.h>

using namespace Paradox::Core;

int main(void)
{
    InitApplication("Paradox Game Engine - Editor", FLAG_WINDOW_RESIZABLE | FLAG_WINDOW_MAXIMIZED);
    MaximizeWindow();

    ecs_world_t* ecs = ecs_init();
    bool checkboxChecked = false;

    while (!WindowShouldClose())
    {
        BeginDrawing();

        ecs_progress(ecs, GetFrameTime());
        DrawFPS(10, 10);

        ClearBackground(DARKGRAY);
        EndDrawing();
    }

    ecs_quit(ecs);
    CloseWindow();

    return 0;
}
