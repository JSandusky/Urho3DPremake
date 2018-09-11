
CommonIncludeDir:insert("../Source/ThirdParty/Assimp/code")

project "Assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "HeaderSymbols",
        "../Source/ThirdParty/Assimp/include",
        "../Source/ThirdParty/Assimp/contrib"
    }
    
    files {
        "../Source/ThirdParty/Assimp/**.hpp",
        "../Source/ThirdParty/Assimp/**.h",
        "../Source/ThirdParty/Assimp/**.cpp",
        "../Source/ThirdParty/Assimp/**.c"
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