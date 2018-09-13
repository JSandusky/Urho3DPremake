dofile "FindOpenCL.lua"
dofile "FindFBX.lua"
dofile "FindFMOD.lua"

WIN32 = true
URHO3D_OPENGL = GetOption("URHO3D_OPENGL", false)
URHO3D_D3D11 = URHO3D_OPENGL == false
URHO3D_DATABASE_SQLITE = GetOption("URHO3D_DATABASE_SQLITE", false)
URHO3D_DATABASE_ODBC = GetOption("URHO3D_DATABASE_ODBC", false)
URHO3D_IK = GetOption("URHO3D_IK", true)
URHO3D_TOOLS = GetOption("URHO3D_TOOLS", false)
URHO3D_SSE = GetOption("URHO3D_SSE", true)
URHO3D_ANGELSCRIPT = GetOption("URHO3D_ANGELSCRIPT", true)
URHO3D_URHO2D = GetOption("URHO3D_URHO2D", true)
URHO3D_NETWORK = GetOption("URHO3D_NETWORK", true)
URHO3D_OPENCL = GetOption("URHO3D_OPENCL", true)
URHO3D_COMPUTE = GetOption("URHO3D_COMPUTE", false)

CommonDefines = { 
    "URHO3D_STATIC_RUNTIME",
    "URHO3D_STATIC_DEFINE", 
    "URHO3D_64BIT",
    "URHO3D_PHYSICS",
    "URHO3D_NAVIGATION",
    "URHO3D_FILEWATCHER",
    "URHO3D_THREADING",
    "URHO3D_PROFILING",
    "URHO3D_LOGGING",
    "URHO3D_PACKAGING"
}
CommonDefines.insert = table.insert
if URHO3D_SSE then
    CommonDefines:insert("URHO3D_SSE")
end
if URHO3D_NETWORK then
    CommonDefines:insert("URHO3D_NETWORK")
end

-- NOTE: this is a hack for these trimmed down files, setup premake actions to do it correctly for your platforms
CommonDefines:insert("WIN32")

CommonIncludeDir = { 
    "HeaderSymbols",
    "../Source/ThirdParty",
    "../Source/ThirdParty/rapidjson/include",
    "../Source/ThirdParty/Eigen",
    "../Source/ThirdParty/igl",
    "../Source/ThirdParty/tetgen"
}
CommonIncludeDir.insert = table.insert

AppDepends = { }
AppDepends.insert = table.insert
AppLinks = { }
AppLinks.insert = table.insert
PlayerModules = { }
PlayerModules.insert = table.insert
PlayerIncludes = { }
PlayerIncludes.insert = table.insert
   
-- These files are always included
if URHO3D_ANGELSCRIPT == true then
    dofile "Angelscript.lua"
end
if URHO3D_URHO2D == true then
    dofile "Box2D.lua"
end
if URHO3D_NETWORK == true then
    dofile "kNet.lua"
end

dofile "Bullet.lua"
dofile "CivetWeb.lua"
dofile "Detour.lua"
dofile "FreeType.lua"
dofile "IK.lua"
dofile "imgui.lua"
dofile "LibCpuId.lua"
dofile "LZ4.lua"
dofile "MathGeoLib.lua"
dofile "PugiXml.lua"
dofile "Recast.lua"
dofile "SDL.lua"
dofile "StanHull.lua"
   
if URHO3D_OPENGL then
    dofile "GLEW.lua"
    URHO3D_OPENGL = true
    CommonDefines:insert("URHO3D_OPENGL")
else
    URHO3D_DIRECTX11 = true
    CommonDefines:insert("URHO3D_D3D11")
end

if GetOption("URHO3D_SQLITE", false) then
    URHO3D_SQLITE = true
    CommonDefines:insert("URHO3D_DATABASE_SQLITE")
end

function UrhoSources(path)
    files { 
        path .. "/*.h", 
        path .. "/*.c", 
        path .. "/*.hpp", 
        path .. "/*.cpp",
        path .. "/*.inl"
    }
end

project "Urho3D"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    characterset "MBCS"
    
    includedirs { "../Source" }
    
    UrhoSources("../Source/Urho3D")
    UrhoSources("../Source/Urho3D/Angelscript")
    UrhoSources("../Source/Urho3D/Audio")
    UrhoSources("../Source/Urho3D/Container")
    UrhoSources("../Source/Urho3D/Core")
    UrhoSources("../Source/Urho3D/Engine")
    UrhoSources("../Source/Urho3D/Graph")
    UrhoSources("../Source/Urho3D/Graphics")
    UrhoSources("../Source/Urho3D/IK")
    UrhoSources("../Source/Urho3D/Input")
    UrhoSources("../Source/Urho3D/IO")
    UrhoSources("../Source/Urho3D/Math")
    UrhoSources("../Source/Urho3D/Navigation")
    UrhoSources("../Source/Urho3D/Physics")
    UrhoSources("../Source/Urho3D/Resource")
    UrhoSources("../Source/Urho3D/Scene")
    UrhoSources("../Source/Urho3D/UI")
    if URHO3D_URHO2D then
        CommonDefines:insert("URHO3D_URHO2D")
        UrhoSources("../Source/Urho3D/Urho2D")
    end
    if URHO3D_NETWORK then
        CommonDefines:insert("URHO3D_NETWORK")
        UrhoSources("../Source/Urho3D/Network")
    end
    
    if URHO3D_OPENCL then
        FindOpenCL()
        AppLinks:insert(clLibrary)
        CommonIncludeDir:insert(clInclude)
        UrhoSources("../Source/Urho3D/Compute")
        UrhoSources("../Source/Urho3D/Compute/OpenCL")
    elseif URHO3D_COMPUTE then
        UrhoSources("../Source/Urho3D/Compute")
        if URHO3D_OPENGL then
            UrhoSources("../Source/Urho3D/Compute/OpenGL")
        else
            UrhoSources("../Source/Urho3D/Compute/Direct3D11")
        end
    end
        
    if URHO3D_OPENGL then
        UrhoSources("../Source/Urho3D/Graphics/OpenGL")
        dependson { "GLEW" }
        links { "GLEW" }
        if WIN32 then
            AppLinks:insert("opengl32.lib")
        end
    else
        UrhoSources("../Source/Urho3D/Graphics/Direct3D11")
        AppLinks:insert("d3dcompiler.lib")
        AppLinks:insert("d3d11.lib")
        AppLinks:insert("dxgi.lib")
        AppLinks:insert("dxguid.lib")
    end
    
    ExtractDeps()
    
    if URHO3D_CARVE then
        UrhoSources("../Source/Urho3D/ProcGeom")
    end
    
    if URHO3D_DATABASE_SQLITE == true then
        UrhoSources("../Source/Urho3D/Database")
        UrhoSources("../Source/Urho3D/Database/SQLite")
    elseif URHO3D_DATABASE_ODBC == true then
        UrhoSources("../Source/Urho3D/Database")
        UrhoSources("../Source/Urho3D/Database/ODBC")
    end
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        
    configuration "vs*"
        buildoptions { "/bigobj" }        

    filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"
      
dofile "Apps/Urho3DPlayer.lua"
Urho3D_ToolProject("Block", false, false)
if URHO3D_CARVE then
    Urho3D_ToolProject("ProcGeo", true, true)
end
if URHO3D_TOOLS == true then
    Urho3D_ToolProject("PackageTool", true, true)
    Urho3D_ToolProject("RampGenerator", true, true)
    Urho3D_ToolProject("ScriptCompiler", true, true)
    Urho3D_ToolProject("OgreImporter", true, true)
    Urho3D_ToolProject("SpritePacker", true, true)
end