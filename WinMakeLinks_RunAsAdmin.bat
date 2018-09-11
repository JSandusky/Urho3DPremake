:: Sets up symbolic link on windows into the target `HeaderSymbols` directory
::      Used to minimize damage to CMake builds
 
ECHO.
mkdir %cd%\Premake\HeaderSymbols
ECHO.   
    
    
rem Urho3D headers
mklink /D %cd%\Premake\HeaderSymbols\Angelscript %cd%\Source\ThirdParty\Angelscript\include
mklink /D %cd%\Premake\HeaderSymbols\ImGui %cd%\Source\ThirdParty\ImGui
mklink /D %cd%\Premake\HeaderSymbols\Bullet %cd%\Source\ThirdParty\Bullet\src
mklink /D %cd%\Premake\HeaderSymbols\SDL %cd%\Source\ThirdParty\SDL\include
mklink /D %cd%\Premake\HeaderSymbols\PugiXml %cd%\Source\ThirdParty\PugiXml\src
mklink /D %cd%\Premake\HeaderSymbols\Detour %cd%\Source\ThirdParty\Detour\include
mklink /D %cd%\Premake\HeaderSymbols\DetourCrowd %cd%\Source\ThirdParty\DetourCrowd\include
mklink /D %cd%\Premake\HeaderSymbols\DetourTileCache %cd%\Source\ThirdParty\DetourTileCache\include
mklink /D %cd%\Premake\HeaderSymbols\Recast %cd%\Source\ThirdParty\Recast\include
mklink /D %cd%\Premake\HeaderSymbols\LibCpuId %cd%\Source\ThirdParty\LibCpuId\src
mklink /D %cd%\Premake\HeaderSymbols\assimp %cd%\Source\ThirdParty\Assimp\include\assimp
mklink /D %cd%\Premake\HeaderSymbols\CivetWeb %cd%\Source\ThirdParty\CivetWeb\include\

ECHO.