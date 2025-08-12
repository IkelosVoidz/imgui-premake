project "ImGui"
	kind "StaticLib"
	language "C++"
    staticruntime "on"
	targetdir ("bin/" .. OutputDir .. "/%{prj.name}")
	objdir ("bin-int/" .. OutputDir .. "/%{prj.name}")

	files
	{
        "imconfig-SFML.h",
        "imgui-SFML_export.h",
        "imgui-SFML.cpp",
        "imgui-SFML.h",
		"imconfig.h",
		"imgui.h",
		"imgui.cpp",
		"imgui_draw.cpp",
		"imgui_internal.h",
		"imgui_tables.cpp",
		"imgui_widgets.cpp",
		"imstb_rectpack.h",
		"imstb_textedit.h",
		"imstb_truetype.h",
        "imgui_demo.cpp",
	}

    includedirs
    {
        ".",
        "%{IncludeDir.SFML}"
    }

    libdirs
    {
        "%{LibDir.SFML}"
    }

     filter "configurations:Debug"
        links
        {
            "sfml-system-d.lib",
            "sfml-graphics-d.lib",
            "sfml-window-d.lib"
        }
        runtime "Debug"
        symbols "On"

    filter "configurations:Release"
        links
        {
            "sfml-system.lib",
            "sfml-graphics.lib",
            "sfml-window.lib"
        }
        runtime "Release"
        optimize "On"

    filter "configurations:Dist"
        runtime "Release"
        optimize "on"
        symbols "off"

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++17"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++17"
