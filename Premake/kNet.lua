
AppLinks:insert("kNet")
AppDepends:insert("kNet")
CommonIncludeDir:insert("../Source/ThirdParty/kNet/include")

project "kNet"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "../Source/ThirdParty/kNet",  
        "../Source/ThirdParty/kNet/include", 
    }
    
    files {
        "../Source/ThirdParty/kNet/src/*.hpp",
        "../Source/ThirdParty/kNet/src/*.h",
        "../Source/ThirdParty/kNet/src/*.cpp",
        "../Source/ThirdParty/kNet/src/*.c",
        "../Source/ThirdParty/kNet/src/boost/*.cpp"
    }   
    
    
    filter { "platforms:x64" }
        files { "../Source/ThirdParty/kNet/src/win32/*.cpp" }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"

   filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"