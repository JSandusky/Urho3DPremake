
AppLinks:insert("JO")
AppDepends:insert("JO")

project "JO"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    files {
        "../Source/ThirdParty/JO/*.h",
        "../Source/ThirdParty/JO/*.cpp"
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