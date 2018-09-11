
AppLinks:insert("SQLite")
AppDepends:insert("SQLite")

project "SQLite"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    dependson { "Recast" }
    links { "Recast" }
    
    includedirs { "../Source/ThirdParty/SQLite/src" }
    
    files {
        "../Source/ThirdParty/SQLite/src/**.h",
        "../Source/ThirdParty/SQLite/src/**.c"
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