
AppLinks:insert("SDL2")
AppDepends:insert("SDL2")

local sdlDir = "../Source/ThirdParty/SDL/src/"

function SDLWindows()
    files {
        sdlDir .. "haptic/windows/*.c",
        sdlDir .. "core/windows/*.c",
        sdlDir .. "joystick/windows/*.c",
        sdlDir .. "power/windows/*.c",
        sdlDir .. "filesystem/windows/*.c",
        sdlDir .. "libm/*.c",
        sdlDir .. "loadso/windows/*.c",
        sdlDir .. "video/windows/*.c",
        sdlDir .. "thread/windows/*.c",
        sdlDir .. "timer/windows/*.c",
        sdlDir .. "main/windows/*.c",
        
        sdlDir .. "audio/directsound/*.c",
        sdlDir .. "audio/wasapi/*.c",
        sdlDir .. "audio/winmm/*.c",
        sdlDir .. "audio/disk/*.c",
        
        sdlDir .. "video/directfb/*.c"
    }
    
    defines {
        "HAVE_LIBC"
    }
end

function SDLAndroid()
    files {
        sdlDir .. "haptic/android/*.c",
        sdlDir .. "core/android/*.c",
        sdlDir .. "joystick/android/*.c",
        sdlDir .. "power/android/*.c",
        sdlDir .. "filesystem/android/*.c",
        sdlDir .. "video/android/*.c",
        sdlDir .. "loadso/dlopen/*.c",
        sdlDir .. "thread/pthread/*.c",
        sdlDir .. "timer/unix/*.c"
    }
end

project "SDL2"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs {
        "../Source/ThirdParty/SDL",
        "../Source/ThirdParty/SDL/include"
    }
    
    files {
        sdlDir .. "*.c",
        sdlDir .. "audio/*.c",
        sdlDir .. "audio/dummy/*.c",
        sdlDir .. "atomic/*.c",
        sdlDir .. "cpuinfo/*.c",
        sdlDir .. "dynapi/*.c",
        sdlDir .. "events/*.c",
        sdlDir .. "file/*.c",
        sdlDir .. "haptic/*.c",
        sdlDir .. "joystick/*.c",
        sdlDir .. "power/*.c",
        sdlDir .. "render/*.c",
        sdlDir .. "render/*/*.c",
        sdlDir .. "stdlib/*.c",
        sdlDir .. "thread/*.c",
        sdlDir .. "thread/generic/*.c",
        sdlDir .. "timer/*.c",
        sdlDir .. "video/*.c",
        sdlDir .. "video/dummy/*.c",
        sdlDir .. "video/yuv2rgb/*.c"
    }
    
    SDLWindows()
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        
    filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"