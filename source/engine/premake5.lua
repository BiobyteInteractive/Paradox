project "engine"
    kind "StaticLib"
    language "C"
    cdialect "C17"

    targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    files { "./src/**.h", "./src/**.c" }

    includedirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/include" }
    libdirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/lib" }
    links { "raylib", "flecs" }

    postbuildcommands { 
        "{COPY} %{wks.location}/vendor/vcpkg/installed/x64-windows/bin/*.dll %{wks.location}/bin/sandbox/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    }

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
