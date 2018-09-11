
AppLinks:insert("Detour")
AppDepends:insert("Detour")
CommonIncludeDir:insert("../Source/ThirdParty/Detour/include")
CommonIncludeDir:insert("../Source/ThirdParty/DetourCrowd/include")
CommonIncludeDir:insert("../Source/ThirdParty/DetourTileCache/include")

project "Detour"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    dependson { "Recast" }
    links { "Recast" }
    
    includedirs { 
        "../Source/ThirdParty/Detour/include",
        "../Source/ThirdParty/DetourCrowd/include",
        "../Source/ThirdParty/DetourTileCache/include",
    }
    
    files {
        "../Source/ThirdParty/Detour*/**.hpp",
        "../Source/ThirdParty/Detour*/**.h",
        "../Source/ThirdParty/Detour*/**.cpp",
        "../Source/ThirdParty/Detour*/**.c"
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