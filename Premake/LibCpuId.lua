AppLinks:insert("LibCpuId")
AppDepends:insert("LibCpuId")

project "LibCpuId"
    kind "StaticLib"
    language "C++"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    defines { "VERSION=4" }
    
    files {
        "../Source/ThirdParty/LibCpuId/**.cpp",
        "../Source/ThirdParty/LibCpuId/**.hpp",
        "../Source/ThirdParty/LibCpuId/**.c",
        "../Source/ThirdParty/LibCpuId/**.h"
    }
   
    includedirs { "../Source/LibCpuId/CivetWeb/include" }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        files { "../Source/ThirdParty/LibCpuId/**.asm" }

   filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"
        files { "../Source/ThirdParty/LibCpuId/**.asm" }