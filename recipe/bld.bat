@echo on

:: Make a build folder and change to it.
mkdir build
cd build

cmake -G Ninja ^
    -DBUILD_SHARED_LIBS=ON ^
    -DCMAKE_BUILD_TYPE:STRING=Release ^
    -DCMAKE_WINDOWS_EXPORT_ALL_SYMBOLS:BOOL=ON ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    ..
if %ERRORLEVEL% neq 0 exit 1

:: Build!
cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1
