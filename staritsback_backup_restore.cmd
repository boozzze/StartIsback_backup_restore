@echo off
chcp 65001 > nul

:menu
cls
echo 1. Создать резервную копию веток реестра
echo 2. Восстановить ветки реестра из резервной копии
echo 3. Выйти
set /p choice=Выберите действие (1/2/3): 

if "%choice%"== "1" (
    reg export HKEY_CURRENT_USER\SOFTWARE\StartIsBack Backup_StartIsBack.reg /y
    reg export "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\StartPage2" Backup_StartPage2.reg /y
    echo Резервная копия создана.
    pause
    exit
) else if "%choice%"== "2" (
    reg import Backup_StartIsBack.reg
    reg import Backup_StartPage2.reg
    echo Ветки реестра восстановлены из резервных копий.
    
    echo Перезапуск проводника Windows...
    taskkill /f /im explorer.exe
    start explorer.exe
    
    pause
    exit
) else if "%choice%"== "3" (
    exit
) else (
    echo Неверный выбор. Пожалуйста, выберите 1, 2 или 3.
    pause
    goto menu
)
