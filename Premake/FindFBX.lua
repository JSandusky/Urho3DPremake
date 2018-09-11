
function FindFBX()

    local fbxPath = GetLibraryPath("FBXSDK", "C:/FBXSDK")
    
    includedirs { fbxPath .. "/include" }
        
    filter "configurations:Debug"
        links { fbxPath .. "/lib/vs2015/debug/libfbxsdk.lib" }
    
    filter "configurations:Release"
        links { fbxPath .. "/lib/vs2015/release/libfbxsdk.lib" }

end