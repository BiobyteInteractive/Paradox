project "sandbox"
    kind "ConsoleApp"
    dependson { "engine" }

    language "C"
    cdialect "C17"

    targetdir "../../bin/%{prj.name}/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
    files { "./src/**.h", "./src/**.c" }

    includedirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/include", "%{wks.location}/source/engine/src" }
    libdirs { "%{wks.location}/vendor/vcpkg/installed/x64-windows/lib", "%{wks.location}/bin/engine/%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}" }
    links { "raylib", "engine" }

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
