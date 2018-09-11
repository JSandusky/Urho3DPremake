
project "ShaderCompiler"
    kind "WindowedApp"
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
        "../../Source/Tools/ShaderCompiler/include", 
        "../../Source/Tools/ShaderCompiler/src/cbstring",
        "../../Source/Tools/ShaderCompiler/src/internal_includes"
    }
    
    files { 
        "../../Source/Tools/ShaderCompiler/**.h",
        "../../Source/Tools/ShaderCompiler/**.c",
        "../../Source/Tools/ShaderCompiler/**.hpp",
        "../../Source/Tools/ShaderCompiler/**.cpp"
    }
    
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