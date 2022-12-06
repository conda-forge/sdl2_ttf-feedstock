@echo on

:: Make a build folder and change to it.
mkdir build
cd build

cmake -G Ninja ^
    -DCMAKE_BUILD_TYPE:STRING=Release ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    ..
if %ERRORLEVEL% neq 0 exit 1

:: Build!
cmake --build .
if %ERRORLEVEL% neq 0 exit 1

cmake --install .
if %ERRORLEVEL% neq 0 exit 1
