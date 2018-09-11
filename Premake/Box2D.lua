
AppLinks:insert("Box2D")
AppDepends:insert("Box2D")
CommonIncludeDir:insert("../Source/ThirdParty/Box2D")

project "Box2D"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "../Source/ThirdParty/Box2D",  
        "../Source/ThirdParty/Box2D/Box2D", 
    }
    
    files {
        "../Source/ThirdParty/Box2D/Box2D/**.hpp",
        "../Source/ThirdParty/Box2D/Box2D/**.h",
        "../Source/ThirdParty/Box2D/Box2D/**.cpp",
        "../Source/ThirdParty/Box2D/Box2D/**.c"
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