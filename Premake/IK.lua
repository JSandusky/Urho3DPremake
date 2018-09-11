AppLinks:insert("IK")
AppDepends:insert("IK")
CommonIncludeDir:insert("../Source/ThirdParty/ik/include")
CommonDefines:insert("URHO3D_IK")

project "IK"
    kind "StaticLib"
    language "C++"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    files {
        "../Source/ThirdParty/ik/**.h",
        "../Source/ThirdParty/ik/**.hpp",
        "../Source/ThirdParty/ik/src/*.c",
        "../Source/ThirdParty/ik/src/*.cpp"
    }
    
    removefiles { "../Source/ThirdParty/ik/platform/linux/*.c" }
    
    includedirs { "../Source/ThirdParty/ik/include" }
    
    filter "configurations:Debug"
      defines { "DEBUG", "WIN32" }
      symbols "On"
      architecture "x64"

   filter "configurations:Release"
      defines { "NDEBUG", "WIN32" }
      optimize "On"
      symbols "On"
      architecture "x64"