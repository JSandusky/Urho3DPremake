
AppLinks:insert("Angelscript")
AppDepends:insert("Angelscript")
CommonDefines:insert("URHO3D_ANGELSCRIPT")
CommonIncludeDir:insert("../Source/ThirdParty/Angelscript/include")

project "Angelscript"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    location "../Generated"
    characterset "MBCS"
    targetdir "../bin/Build/%{cfg.buildcfg}"
    
    includedirs { 
        "../Source/ThirdParty/Angelscript/include", 
        "../Source/ThirdParty/Angelscript/source"
    }
    
    files {
        "../Source/ThirdParty/Angelscript/include/angelscript.h",
        "../Source/ThirdParty/Angelscript/source/as_array.h",
        "../Source/ThirdParty/Angelscript/source/as_atomic.cpp",
        "../Source/ThirdParty/Angelscript/source/as_atomic.h",
        "../Source/ThirdParty/Angelscript/source/as_builder.cpp",
        "../Source/ThirdParty/Angelscript/source/as_builder.h",
        "../Source/ThirdParty/Angelscript/source/as_bytecode.cpp",
        "../Source/ThirdParty/Angelscript/source/as_bytecode.h",
        "../Source/ThirdParty/Angelscript/source/as_callfunc.cpp",
        "../Source/ThirdParty/Angelscript/source/as_callfunc.h",
        "../Source/ThirdParty/Angelscript/source/as_compiler.cpp",
        "../Source/ThirdParty/Angelscript/source/as_compiler.h",
        "../Source/ThirdParty/Angelscript/source/as_config.h",
        "../Source/ThirdParty/Angelscript/source/as_configgroup.cpp",
        "../Source/ThirdParty/Angelscript/source/as_configgroup.h",
        "../Source/ThirdParty/Angelscript/source/as_context.cpp",
        "../Source/ThirdParty/Angelscript/source/as_context.h",
        "../Source/ThirdParty/Angelscript/source/as_criticalsection.h",
        "../Source/ThirdParty/Angelscript/source/as_datatype.cpp",
        "../Source/ThirdParty/Angelscript/source/as_datatype.h",
        "../Source/ThirdParty/Angelscript/source/as_debug.h",
        "../Source/ThirdParty/Angelscript/source/as_gc.cpp",
        "../Source/ThirdParty/Angelscript/source/as_gc.h",
        "../Source/ThirdParty/Angelscript/source/as_generic.cpp",
        "../Source/ThirdParty/Angelscript/source/as_generic.h",
        "../Source/ThirdParty/Angelscript/source/as_globalproperty.cpp",
        "../Source/ThirdParty/Angelscript/source/as_map.h",
        "../Source/ThirdParty/Angelscript/source/as_memory.cpp",
        "../Source/ThirdParty/Angelscript/source/as_memory.h",
        "../Source/ThirdParty/Angelscript/source/as_module.cpp",
        "../Source/ThirdParty/Angelscript/source/as_module.h",
        "../Source/ThirdParty/Angelscript/source/as_namespace.h",
        "../Source/ThirdParty/Angelscript/source/as_objecttype.cpp",
        "../Source/ThirdParty/Angelscript/source/as_objecttype.h",
        "../Source/ThirdParty/Angelscript/source/as_outputbuffer.cpp",
        "../Source/ThirdParty/Angelscript/source/as_outputbuffer.h",
        "../Source/ThirdParty/Angelscript/source/as_parser.cpp",
        "../Source/ThirdParty/Angelscript/source/as_parser.h",
        "../Source/ThirdParty/Angelscript/source/as_property.h",
        "../Source/ThirdParty/Angelscript/source/as_restore.cpp",
        "../Source/ThirdParty/Angelscript/source/as_restore.h",
        "../Source/ThirdParty/Angelscript/source/as_scriptcode.cpp",
        "../Source/ThirdParty/Angelscript/source/as_scriptcode.h",
        "../Source/ThirdParty/Angelscript/source/as_scriptengine.cpp",
        "../Source/ThirdParty/Angelscript/source/as_scriptengine.h",
        "../Source/ThirdParty/Angelscript/source/as_scriptfunction.cpp",
        "../Source/ThirdParty/Angelscript/source/as_scriptfunction.h",
        "../Source/ThirdParty/Angelscript/source/as_scriptnode.cpp",
        "../Source/ThirdParty/Angelscript/source/as_scriptnode.h",
        "../Source/ThirdParty/Angelscript/source/as_scriptobject.cpp",
        "../Source/ThirdParty/Angelscript/source/as_scriptobject.h",
        "../Source/ThirdParty/Angelscript/source/as_string.cpp",
        "../Source/ThirdParty/Angelscript/source/as_string.h",
        "../Source/ThirdParty/Angelscript/source/as_string_util.cpp",
        "../Source/ThirdParty/Angelscript/source/as_string_util.h",
        "../Source/ThirdParty/Angelscript/source/as_symboltable.h",
        "../Source/ThirdParty/Angelscript/source/as_texts.h",
        "../Source/ThirdParty/Angelscript/source/as_thread.cpp",
        "../Source/ThirdParty/Angelscript/source/as_thread.h",
        "../Source/ThirdParty/Angelscript/source/as_tokendef.h",
        "../Source/ThirdParty/Angelscript/source/as_tokenizer.cpp",
        "../Source/ThirdParty/Angelscript/source/as_tokenizer.h",
        "../Source/ThirdParty/Angelscript/source/as_typeinfo.cpp",
        "../Source/ThirdParty/Angelscript/source/as_typeinfo.h",
        "../Source/ThirdParty/Angelscript/source/as_variablescope.cpp",
        "../Source/ThirdParty/Angelscript/source/as_variablescope.h"
    }
    
    filter "configurations:Debug"
        defines { "DEBUG", "WIN32" }
        symbols "On"
        architecture "x64"
        files { 
            "../Source/ThirdParty/Angelscript/source/as_callfunc_x64_msvc.cpp",
            "../Source/ThirdParty/Angelscript/source/as_callfunc_x64_msvc_asm.asm"
        }

   filter "configurations:Release"
        defines { "NDEBUG", "WIN32" }
        optimize "On"
        symbols "On"
        architecture "x64"
        files { 
            "../Source/ThirdParty/Angelscript/source/as_callfunc_x64_msvc.cpp",
            "../Source/ThirdParty/Angelscript/source/as_callfunc_x64_msvc_asm.asm"
        }