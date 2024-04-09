cd ..;
git submodule update --init --recursive;
$Env:VCPKG_DEFAULT_TRIPLET = "x64-windows";
.\vendor\vcpkg\bootstrap-vcpkg.bat -disableMetrics;

.\vendor\vcpkg\vcpkg.exe install raylib;
.\vendor\vcpkg\vcpkg.exe install raygui;
.\vendor\vcpkg\vcpkg.exe install joltphysics;
.\vendor\vcpkg\vcpkg.exe install flecs;
.\vendor\vcpkg\vcpkg.exe install enet;
.\vendor\vcpkg\vcpkg.exe install lua;

.\vendor\windows\premake5\premake5.exe vs2022;

cd .\scripts;
