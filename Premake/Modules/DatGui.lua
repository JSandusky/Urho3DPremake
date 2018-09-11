
PlayerModules:insert("DatGui")
PlayerIncludes:insert("../../Source/Modules/DatGui")

project "DatGui"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "../../Source/Modules",
        "../../Source"
    }
    
    files {
        "../../Source/Modules/DatGui/**.h",
        "../../Source/Modules/DatGui/**.cpp"
    }
    
    ExtractDeps("../")
    dependson { "Urho3D" }
    links { "Urho3D" }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        
    filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"