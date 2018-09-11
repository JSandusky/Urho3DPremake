
dofile "Premake/Util.lua"

workspace "Urho3D"
    startproject "Urho3D"
    configurations { "Debug", "Release" }
    platforms { "x64" }

dofile "Premake/Urho3D.lua"