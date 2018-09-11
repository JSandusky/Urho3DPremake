AppLinks:insert("MathGeoLib")
AppDepends:insert("MathGeoLib")
CommonIncludeDir:insert("../Source/ThirdParty/MathGeoLib/src")

project "MathGeoLib"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    files { 
        "../Source/ThirdParty/MathGeoLib/src/**.h",
        "../Source/ThirdParty/MathGeoLib/src/**.hpp",
        "../Source/ThirdParty/MathGeoLib/src/**.cpp",
        "../Source/ThirdParty/MathGeoLib/src/**.c"
    }
    
    includedirs {
        "../Source/ThirdParty/MathGeoLib/src"
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