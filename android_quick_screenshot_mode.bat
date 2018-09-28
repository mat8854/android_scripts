@echo off

adb shell settings put global sysui_demo_allowed 1 

:: display time 12:00
adb shell am broadcast -a com.android.systemui.demo -e command clock -e hhmm 1200

:: show full wifi
adb shell am broadcast -a com.android.systemui.demo -e command network -e wifi show -e level 4

:: display full mobile data with type LTE
adb shell am broadcast -a com.android.systemui.demo -e command network -e mobile show -e level 4 -e datatype lte

:: hide notifications
adb shell am broadcast -a com.android.systemui.demo -e command notifications -e visible false

:: show full battery but not in charging state
adb shell am broadcast -a com.android.systemui.demo -e command battery -e plugged false -e level 100

echo Now in screenshot mode. Press any key to exit screenshot mode ...
pause

adb shell am broadcast -a com.android.systemui.demo -e command exit
