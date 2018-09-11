AppLinks:insert("GLEW")
AppDepends:insert("GLEW")
CommonDefines:insert("GLEW_STATIC")

project "GLEW"
    kind "StaticLib"
    language "C++"
    location "Generated"
    targetdir "../bin/GLEW/%{cfg.buildcfg}"
    characterset "MBCS"
    
    files { "../Source/ThirdParty/GLEW/*.h", "../Source/ThirdParty/GLEW/*.c" }
    
    includedirs { "../Source/ThirdParty/GLEW" }
    
    defines { "GLEW_STATIC" }
    
    filter "configurations:Debug"
      defines { "DEBUG", "WIN32" }
      symbols "On"
      architecture "x64"

   filter "configurations:Release"
      defines { "NDEBUG", "WIN32" }
      optimize "On"
      symbols "On"
      architecture "x64"