
clInclude = ""
clLibrary = ""

function FindOpenCL()

    clInclude = GetLibraryPath("OPENCL_INCLUDE", "C:/Program Files (x86)/Intel/OpenCL SDK/6.1/include")
    clLibrary = GetLibraryPath("OPENCL_LIB", "C:/Program Files (x86)/Intel/OpenCL SDK/6.1/lib/x64/OpenCL.lib")
    
    includedirs { clInclude }
    links { clLibrary }

end