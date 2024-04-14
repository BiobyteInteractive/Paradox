project "engine"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"

    targetdir "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    files { "./src/**.h", "./src/**.c", "./src/**.hpp", "./src/**.cpp" }

    includedirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/include" }
    libdirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/lib" }
    links { "raylib", "flecs" }

    postbuildcommands { 
        '{COPY} "%{wks.location}/vendor/vcpkg/installed/x64-windows/bin/*.dll" "%{wks.location}/bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}/"'
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