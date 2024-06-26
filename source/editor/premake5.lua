project "editor"
    kind "ConsoleApp"
    dependson { "engine" }

    language "C++"
    cppdialect "C++17"

    targetdir "../../bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    files { "./src/**.h", "./src/**.c", "./src/**.hpp", "./src/**.cpp" }

    includedirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/include", "%{wks.location}/source/engine/src" }
    libdirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/lib", "%{wks.location}/bin/engine/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" }
    links { "raylib", "engine" }

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
	