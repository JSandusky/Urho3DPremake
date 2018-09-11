
AppLinks:insert("Bullet")
AppDepends:insert("Bullet")
CommonIncludeDir:insert("../Source/ThirdParty/Bullet/src")

project "Bullet"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { "../Source/ThirdParty/Bullet/src" }
    
    files {
        "../Source/ThirdParty/Bullet/**.hpp",
        "../Source/ThirdParty/Bullet/**.h",
        "../Source/ThirdParty/Bullet/**.cpp",
        "../Source/ThirdParty/Bullet/**.c"
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