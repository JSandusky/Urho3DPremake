AppLinks:insert("LZ4")
AppDepends:insert("LZ4")

project "LZ4"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { "../Source/ThirdParty/LZ4" }
    
    files {
        "../Source/ThirdParty/LZ4/**.h",
        "../Source/ThirdParty/LZ4/**.c"
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