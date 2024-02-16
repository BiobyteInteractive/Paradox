workspace "Paradox"
    configurations { "Debug", "Release" }
    architecture "x64"
    startproject "sandbox"

include "source/engine/premake5.lua"
include "source/editor/premake5.lua"
include "source/sandbox/premake5.lua"