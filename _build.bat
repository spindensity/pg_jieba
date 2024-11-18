call "%VS2022INSTALLDIR%\VC\Auxiliary\Build\vcvars64.bat"
if exist msvc_build\ (
    rd /S /Q msvc_build\
)
cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -B msvc_build -S .
cmake --build msvc_build --config Release

