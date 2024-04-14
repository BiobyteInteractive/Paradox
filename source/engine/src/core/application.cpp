#include "application.hpp"

namespace Paradox {
    namespace Core {
        void InitApplication(const char* title, unsigned int flags)
        {
            const int screenWidth = 800;
            const int screenHeight = 450;

            SetConfigFlags(flags);

            InitWindow(screenWidth, screenHeight, title);
            SetExitKey(NULL);

            SetTargetFPS(0);
        }
    }
}

