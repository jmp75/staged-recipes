REM Build moirai.
@REM Credits: some material in this file are courtesy of Kavid Kent (ex Australian Bureau of Meteorology)

mkdir build
cd build

set PATH="%PREFIX%\bin";%PATH%

:: Configure using the CMakeFiles
cmake -G "%CMAKE_GENERATOR%" ^
      -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_PREFIX_PATH:PATH="%LIBRARY_PREFIX%" ^
      -DCMAKE_BUILD_TYPE:STRING=Release ^
      ..

if %errorlevel% neq 0 exit 1
msbuild /p:Configuration=Release /v:q /clp:/v:q "INSTALL.vcxproj"
if %errorlevel% neq 0 exit 1
@REM xcopy /S /Y install\lib\*.* %LIBRARY_LIB%\
@REM xcopy /S /Y install\include\*.* %LIBRARY_INC%\
@REM if %errorlevel% neq 0 exit 1
@REM del *.*
