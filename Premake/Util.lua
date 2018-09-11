
function script_table_insert(tgtTable, value)
    table.insert(tgtTable, value)
end

function CreateScriptTable()
    local ret = { }
    ret.insert = script_table_insert
    return ret;
end

-- Split a string
-- https://gist.github.com/jaredallard/ddb152179831dd23b230
function string:split(delimiter)
  local result = { }
  local from  = 1
  local delim_from, delim_to = string.find( self, delimiter, from  )
  while delim_from do
    table.insert( result, string.sub( self, from , delim_from-1 ) )
    from  = delim_to + 1
    delim_from, delim_to = string.find( self, delimiter, from  )
  end
  table.insert( result, string.sub( self, from  ) )
  return result
end

function string.is_empty(s)
    return s == nil or s == ''
end

function string.starts_with(String,Start)
   return string.sub(String,1,string.len(Start))==Start
end

function file_exists(path)
    local fil = io.open(path)
    if fil ~= nil then 
        io.close(fil) 
        return true 
    else 
        return false 
    end
end

function GetPathInternal(file, target, default)
    if file_exists(file) == false then
        return default
    end

    for line in io.lines(file) do
        if string.is_empty(line) == false and line:starts_with("#") == false then
            local parts = line:split("=")
            if parts[1] == target then
                return parts[2]
            end
        end
    end    
    return default
end

function GetOptionInternal(fromFile, target, default)
    if file_exists(fromFile) == false then
        return default
    end

    for line in io.lines(fromFile) do
        if string.is_empty(line) == false and line:starts_with("#") == false then
            local parts = line:split("=")
            if parts[1] == target then
                local lCase = parts[2]:lower()
                if lCase == "on" or lCase == "true" then 
                    return true
                end
                return false;
            end
        end
    end    
    return default
end

function GetOption(target, default)
    return GetOptionInternal("../Options.txt", target, default)
end

function GetLibraryPath(target, default)
    return GetPathInternal("Paths.txt", target, default)
end

function ExtractDeps(prefix)
    for k,d in pairs(AppDepends) do
        if (type(k) == type(1)) then
            dependson { d }
        end
    end
    for k,d in pairs(AppLinks) do
        if (type(k) == type(1)) then
            links { d }
        end
    end
    for k,d in pairs(CommonIncludeDir) do
        if (type(k) == type(1)) then 
            if prefix ~= nil then
                includedirs { prefix .. d }
            else
                includedirs { d }
            end
        end
    end
    for k,d in pairs(CommonDefines) do
        if (type(k) == type(1)) then
            defines { d }
        end
    end
end

function ExtractModules(prefix)
    for k,d in pairs(PlayerModules) do
        if (type(k) == type(1)) then
            dependson { d }
            links { d }
        end
    end
    for k,d in pairs(PlayerIncludes) do
        if (type(k) == type(1)) then
            if prefix ~= nil then
                includedirs { prefix .. d }
            else
                includedirs { d }
            end
        end
    end
end

-- NOTE: You'll have to customize this for your actual targets
function LinkSystem(forAndroid, forDebug)
    if forAndroid == false then
        links { 
            "winmm.lib",
            "imm32.lib",
            "ws2_32.lib",
            "version.lib"
        }
        
        if URHO3D_OPENGL == true then
            links { "opengl32.lib" }
        end
        
        if forDebug == true then
            links { "dbghelp.lib" }
        end
    else
        
    end
end

function Urho3D_ToolProject(name, isConsole, outputToTools)
    project( name )
        if isConsole == true then
            kind "ConsoleApp"
        else
            kind "WindowedApp"
            dpiawareness "HighPerMonitor"
        end
        
        language "C++"
        cppdialect "C++11"
        location "../Generated"
        if outputToTools == true then
            targetdir(path.getabsolute("../bin/Tools"))
            debugdir(path.getabsolute("../bin/Tools"))
        else
            targetdir(path.getabsolute("../bin"))
            debugdir(path.getabsolute("../bin"))
        end
        characterset "MBCS"
        
        dependson { "Urho3D" }
        links { "Urho3D" }
        
        ExtractDeps()
        
        includedirs { 
            "../Source/Tools/" .. name, 
            "../Source"
        }
        
        files { "../Source/Tools/" .. name .. "/*.*" }
        
        filter "configurations:Debug"
            defines { "DEBUG", "WIN32" }
            symbols "On"
            architecture "x64"
            LinkSystem(false, true)

        filter "configurations:Release"
            defines { "NDEBUG", "WIN32" }
            optimize "On"
            symbols "On"
            architecture "x64"
            LinkSystem(false, false)
          
        configuration "vs*"
            buildoptions { "/bigobj" }
end