AppLinks:insert("Carve")
AppDepends:insert("Carve")
CommonIncludeDir:insert("../Source/ThirdParty/Carve")

AppLinks:insert("Tetgen")
AppDepends:insert("Tetgen")
CommonIncludeDir:insert("../Source/ThirdParty/tetgen")
CommonDefines:insert("TETLIBRARY")

-- Tetgen is required for LibIGL to use tetrahedra
project "Tetgen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs {
        "../Source/ThirdParty/tetgen"
    }
    
    files {
        "../Source/ThirdParty/tetgen/*.cxx",
        "../Source/ThirdParty/tetgen/*.h"
    }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32", "TETLIBRARY" }
        symbols "On"
        architecture "x64"

    filter "configurations:Release"
        defines { "NDEBUG", "WIN32", "TETLIBRARY" }
        optimize "On"
        symbols "On"
        architecture "x64"

-- Actual Carve CSG library
project "Carve"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "../Source/ThirdParty"
    }
    
    files {
        "../Source/ThirdParty/Carve/**.hpp",
        "../Source/ThirdParty/Carve/**.h",
        "../Source/ThirdParty/Carve/source/aabb.cpp",
        "../Source/ThirdParty/Carve/source/carve.cpp",
        "../Source/ThirdParty/Carve/source/convex_hull.cpp",
        "../Source/ThirdParty/Carve/source/csg.cpp",
        "../Source/ThirdParty/Carve/source/csg_collector.cpp",
        "../Source/ThirdParty/Carve/source/edge.cpp",
        "../Source/ThirdParty/Carve/source/face.cpp",
        "../Source/ThirdParty/Carve/source/geom2d.cpp",
        "../Source/ThirdParty/Carve/source/geom3d.cpp",
        "../Source/ThirdParty/Carve/source/intersect.cpp",
        "../Source/ThirdParty/Carve/source/intersection.cpp",
        "../Source/ThirdParty/Carve/source/intersect_classify_edge.cpp",
        "../Source/ThirdParty/Carve/source/intersect_classify_group.cpp",
        "../Source/ThirdParty/Carve/source/intersect_debug.cpp",
        "../Source/ThirdParty/Carve/source/intersect_face_division.cpp",
        "../Source/ThirdParty/Carve/source/intersect_group.cpp",
        "../Source/ThirdParty/Carve/source/intersect_half_classify_group.cpp",
        "../Source/ThirdParty/Carve/source/math.cpp",
        "../Source/ThirdParty/Carve/source/mesh.cpp",
        "../Source/ThirdParty/Carve/source/octree.cpp",
        "../Source/ThirdParty/Carve/source/pointset.cpp",
        "../Source/ThirdParty/Carve/source/polyhedron.cpp",
        "../Source/ThirdParty/Carve/source/polyline.cpp",
        "../Source/ThirdParty/Carve/source/tag.cpp",
        "../Source/ThirdParty/Carve/source/timing.cpp",
        "../Source/ThirdParty/Carve/source/triangulator.cpp"
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
    