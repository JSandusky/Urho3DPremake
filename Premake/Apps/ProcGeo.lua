
project "ProcGeo"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++11"
    location "../../Generated"
    targetdir "../../bin/Tools"
    characterset "MBCS"
    
    dependson { "Urho3D" }
    links { "Urho3D" }
    
    ExtractDeps()
    
    includedirs { 
        "../../Source",
        "../../Source/Tools/ProcGeo"
    }
    
    files { "../../Source/Tools/ProcGeo/**.*" }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        LinkSystem(false, true)

   filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"
        LinkSystem(false, false)
        
    configuration "vs*"
        buildoptions { "/bigobj" }