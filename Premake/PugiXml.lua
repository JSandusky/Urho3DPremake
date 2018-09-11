
AppLinks:insert("PugiXml")
AppDepends:insert("PugiXml")

project "PugiXml"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { "../Source/ThirdParty/PugiXml" }
    
    files {
        "../Source/ThirdParty/PugiXml/**.cpp",
        "../Source/ThirdParty/PugiXml/**.hpp"
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