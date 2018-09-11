AppLinks:insert("FreeType2")
AppDepends:insert("FreeType2")
CommonIncludeDir:insert("../Source/ThirdParty/FreeType/include")

local basePath = "../Source/ThirdParty/FreeType/src/"

project "FreeType2"
    kind "StaticLib"
    language "C++"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    includedirs { "../Source/ThirdParty/FreeType/include" }
    
    files
    {
        basePath .. "autofit/autofit.c",
        basePath .. "bdf/bdf.c",
        basePath .. "cff/cff.c",
        basePath .. "base/ftbase.c",
        basePath .. "base/ftbitmap.c",
        basePath .. "cache/ftcache.c",
        basePath .. "base/ftdebug.c",
        basePath .. "base/ftfstype.c",
        basePath .. "base/ftglyph.c",
        basePath .. "gzip/ftgzip.c",
        basePath .. "base/ftinit.c",
        basePath .. "lzw/ftlzw.c",
        basePath .. "base/ftstroke.c",
        basePath .. "base/ftsystem.c",
        basePath .. "smooth/smooth.c",

        basePath .. "base/ftbbox.c",
        basePath .. "base/ftgxval.c",
        basePath .. "base/ftlcdfil.c",
        basePath .. "base/ftmm.c",
        basePath .. "base/ftotval.c",
        basePath .. "base/ftpatent.c",
        basePath .. "base/ftpfr.c",
        basePath .. "base/ftsynth.c",
        basePath .. "base/ftfstype.c",
        basePath .. "pcf/pcf.c",
        basePath .. "pfr/pfr.c",
        basePath .. "psaux/psaux.c",
        basePath .. "pshinter/pshinter.c",
        basePath .. "psnames/psmodule.c",
        basePath .. "raster/raster.c",
        basePath .. "sfnt/sfnt.c",
        basePath .. "truetype/truetype.c",
        basePath .. "type1/type1.c",
        basePath .. "cid/type1cid.c",
        basePath .. "type42/type42.c",
        basePath .. "winfonts/winfnt.c",      
    }
    
    defines
    {
        "WIN32",
        "WIN32_LEAN_AND_MEAN",
        "VC_EXTRALEAN",
        "_CRT_SECURE_NO_WARNINGS",
        "FT2_BUILD_LIBRARY",      
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