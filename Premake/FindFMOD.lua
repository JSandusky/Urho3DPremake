

function FindFMOD()

    local fmodPath = GetLibraryPath("FMOD", "C:/Program Files (x86)/FMOD SoundSystem/FMOD Studio API Windows/api")
    
    includedirs { fmodPath .. "/fsbank/inc" }
    includedirs { fmodPath .. "/lowlevel/inc" }
    includedirs { fmodPath .. "/studio/inc" }
    
    links { fmodPath .. "/fsbank/lib/fsbank64_vc.lib" }
    links { fmodPath .. "/lowlevel/lib/fmod64_vc.lib" }
    links { fmodPath .. "/studio/lib/fmodstudio64_vc.lib" }

end