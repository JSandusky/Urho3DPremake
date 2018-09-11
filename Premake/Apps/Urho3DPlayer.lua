
project "Urho3DPlayer"
    kind "WindowedApp"
    language "C++"
    cppdialect "C++11"
    location "../../Generated"
    targetdir "../../bin"
    characterset "MBCS"
    dpiawareness "HighPerMonitor"
    
    dependson { "Urho3D" }
    links { "Urho3D" }
    
    ExtractDeps("../")
    ExtractModules("../")
    
    includedirs { 
        "../../Source",
        "../../Source/Tools/Urho3DPlayer"
    }
    
    files { "../../Source/Tools/Urho3DPlayer/*.*" }
    
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