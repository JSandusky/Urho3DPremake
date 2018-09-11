
AppLinks:insert("StanHull")
AppDepends:insert("StanHull")

project "StanHull"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { "../Source/ThirdParty/StanHull" }
    
    files {
        "../Source/ThirdParty/StanHull/**.cpp",
        "../Source/ThirdParty/StanHull/**.h"
    }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"

   filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"