#include "application.h"

void InitApplication(const char* title) 
{
    const int screenWidth = 800;
    const int screenHeight = 450;

    InitWindow(screenWidth, screenHeight, title);

    SetTargetFPS(0);
}
