@echo off
REM PKEMEDIA Studio Portable Installer for ComfyUI-Manager
REM Pretty Kitty Entertainment - Production Ready Setup

setlocal enabledelayedexpansion

echo ================================================
echo   PKEMEDIA ComfyUI-Manager Studio Installer
echo   Pretty Kitty Entertainment Production Edition
echo ================================================
echo.

echo [1/5] Checking for gitpython...
if not exist ".\python_embeded\python.exe" (
    echo ERROR: python_embeded not found. Run this from your ComfyUI_windows_portable folder.
    pause
    exit /b 1
)

.\python_embeded\python.exe -s -m pip install gitpython --quiet

echo [2/5] Cloning / updating PKEMEDIA ComfyUI-Manager fork...
git clone https://github.com/PKEMEDIA/comfyui-manager.git .\ComfyUI\custom_nodes\comfyui-manager 2>nul || (
    echo Updating existing installation...
    cd .\ComfyUI\custom_nodes\comfyui-manager
    git pull origin main
    cd ..\..\..
)

echo [3/5] Installing requirements...
.\python_embeded\python.exe -m pip install -r .\ComfyUI\custom_nodes\comfyui-manager\requirements.txt --quiet

echo [4/5] Applying PKEMEDIA Studio hardened config...
if not exist ".\ComfyUI\user" mkdir ".\ComfyUI\user"
copy /Y pkemedia-studio-config.ini .\ComfyUI\user\comfyui-manager-config.ini >nul 2>&1 || echo Config template ready - copy manually if needed.
echo (You can also copy pkemedia-studio-config.ini to your __manager__ folder for protected path setups)

echo [5/5] Setup complete!
echo.
echo ================================================
echo   SUCCESS: PKEMEDIA Studio Manager installed!
echo   - Branded UI with your identity
echo   - Hardened security + uv enabled
echo   - Media production channel preloaded
echo   - Ready for character-consistent video & adult content pipelines

echo Next steps:
echo   1. Restart ComfyUI
echo   2. Click Manager button
echo   3. Use 'Install Custom Nodes' and select PKEMEDIA channel
echo   4. Customize pkemedia-channel.json with your exact nodes

echo ================================================
echo.
pause