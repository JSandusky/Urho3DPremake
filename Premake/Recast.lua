AppLinks:insert("Recast")
AppDepends:insert("Recast")

project "Recast"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { "../Source/ThirdParty/Recast/include" }
    
    files {
        "../Source/ThirdParty/Recast/**.hpp",
        "../Source/ThirdParty/Recast/**.h",
        "../Source/ThirdParty/Recast/**.cpp",
        "../Source/ThirdParty/Recast/**.c"
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