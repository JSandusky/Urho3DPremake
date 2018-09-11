AppLinks:insert("CivetWeb")
AppDepends:insert("CivetWeb")
CommonIncludeDir:insert("../Source/ThirdParty/CivetWeb/include")
CommonDefines:insert("MG_LEGACY_INTERFACE")
CommonDefines:insert("NO_CGI")

project "CivetWeb"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    files {
        "../Source/ThirdParty/Civetweb/**.c",
        "../Source/ThirdParty/Civetweb/**.h"
    }
    
    includedirs { "../Source/ThirdParty/CivetWeb/include" }
    
    defines { "MG_LEGACY_INTERFACE", "NO_CGI" }
    
    filter "configurations:Debug"
      defines { "DEBUG", "WIN32" }
      symbols "On"
      architecture "x64"

   filter "configurations:Release"
      defines { "NDEBUG", "WIN32" }
      optimize "On"
      symbols "On"
      architecture "x64"