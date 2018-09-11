# Urho3D Premake Scripts

## Why? CMake is already there

Broader platform support.

- Many 3rd party console libraries come with Premake scripts, but not with CMake scripts
  - One does not use SDL for audio on the 3DS
- CMake is generally behind by several years, for example VS-Android has been a thing for years now and CMake still doesn't support it officially.


- Lua is generally easier to interpret and work with than CMake's language.
- Writing Premake scripts for 3rd party libraries is generally quite simple
- No build-tree and source-tree mess
  - Everything is in one location



# Warnings

These scripts have been stripped pretty intensely. Vendor/target specific stuff has been removed so they are reduced down to WIN32.

Basic checks of ensuring the WIN32 stuff works have been made.

## Configuration

URHO3D_XXX options are read from an "Options.txt" file in the root directory, the contents should be written key-value pairs separated by an equals. 

`URHO3D_URHO2D = false`

Configurable paths come from a "Paths.txt" file in the root directory, the contents should also be key value pairs.

```FMOD_DIR = C:\Program Files (x86)\FMOD Studio\Api
FMOD_DIR = C:\Program Files (x86)\FMOD Studio\Api
FBXSDK = D:\FBXSDK
```

## What Compiles

- Urho3D Player
  - Urho2D
  - OpenGL / DX11
    - Time to let DX9 die in peace
  - Network
  - Database (SQLite/ODBC)
  - Angelscript
  - IK
- RampGenerator
- OgreImporter
- PackageTool
- SpritePacker


## What Doesn't Compile

- Assimp
  - It's a steaming mess
- Lua
  - Not a fan of Lua ... I do see the humor