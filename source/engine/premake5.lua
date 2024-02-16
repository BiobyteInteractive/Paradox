project "engine"
    kind "StaticLib"
    language "C"
    cdialect "C17"

    targetdir "../../bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    files { "./src/**.h", "./src/**.c" }

    includedirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/include" }
    libdirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/lib" }
    links { "raylib" }

    filter "configurations:Release"
        defines
		{
			"NDEBUG"
		}
        optimize "On"

    filter "configurations:Debug"
		defines
		{
            "DEBUG"
		}
		symbols "On"