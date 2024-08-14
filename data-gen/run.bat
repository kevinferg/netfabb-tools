@echo off

set USER_ID=1
set ADDRESS="C"
set DATAGEN_FOLDER=data-gen

set CONDA_EXE="\\%ADDRESS%\users\users%USER_ID%\%username%\miniconda\Scripts\conda.exe"
set PYTHON_SCRIPT="\\%ADDRESS%\users\users%USER_ID%\%username%\Desktop\%DATAGEN_FOLDER%\batch-simulate.py"
set EXTRACTION_SCRIPT="\\%ADDRESS%\users\users%USER_ID%\%username%\Desktop\%DATAGEN_FOLDER%\extract-netfabb-data-binary.py"
set INDEX_FILE="\\%ADDRESS%\users\users%USER_ID%\%username%\Desktop\%DATAGEN_FOLDER%\start-stop-indices.txt"

set /P INDICES=<%INDEX_FILE%

echo.
echo Beginning batch simulation for shape indices: %INDICES%
echo Running Python script through Conda...
echo Check progress in C:\Users\%username%\SandBox\messages.txt
echo.

CALL %CONDA_EXE% run -n base python %PYTHON_SCRIPT% %INDICES% %username%

CALL %CONDA_EXE% run -n base python %EXTRACTION_SCRIPT% %username%

pause
