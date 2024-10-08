﻿; 永劫无间 征神之路 雪满弓刀 全自动
; AutoHotKey文档：https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm


global SleepTimePerLoop         := 250
global OnLooping 		        := 0

global LastSkipCGTimeTickCount  := 0
global PressEscTimeInterval     := 40000   ; ms

global Challenging              := 0


#MenuMaskKey vkFF
; 修改默认模拟击键，否则按下win/alt松开之前，会默认触发Ctrl键
; Debug时可以使用KeyCastOW来测试具体按下什么键
; https://wyagd001.github.io/zh-cn/docs/Hotkeys.htm
; https://wyagd001.github.io/zh-cn/docs/commands/_MenuMaskKey.htm


if not A_IsAdmin {
	MsgBox, 请使用管理员权限运行本程序。
	ExitApp
}


Log(message) {
    logFilePath := "script_log.txt"
    timestamp := A_Now
    formattedMessage := "[" . timestamp . "] " . message . "`n"
    FileAppend, %formattedMessage%, %logFilePath%
}


MyImageSearch(Image, X1, Y1, X2, Y2) {
    ImageSearch, FoundX, FoundY, X1, Y1, X2, Y2, *80 %Image%
    
    if (ErrorLevel = 2){
        MsgBox 查找图像失败，请确保%Image%与本程序在同一目录下
        ExitApp
    }
        
    ; 屏幕中没找到指定图像
    else if (ErrorLevel = 1){
        Return 0
    }
    
    ; 屏幕中找到了指定图像
    else {
        Return 1
    }
}


MyMouseClick(X, Y) {
    MouseClick, , %X%, %Y%
}


Run() {
    if (OnLooping = 1) {
        Return
    }

    OnLooping = 1
	Loop {
        Sleep, %SleepTimePerLoop%

        if (OnLooping = 0) {
			Return
		}

		else {
			pid := WinActive("ahk_exe NarakaBladepoint.exe")
			if (pid){

                if MyImageSearch("Img\开始征神.jpg", 1735, 947, 1896, 1046) {
                    MyMouseClick(1700, 998)
                    continue
                }

                if MyImageSearch("Img\疲劳值.jpg", 746, 487, 1008, 588) {
                    MyMouseClick(797, 624)
                    continue
                }
                
                if MyImageSearch("Img\使用英雄.jpg", 1599, 914, 1678, 961) {
                    MyMouseClick(1643, 941)
                    continue
                }

                if MyImageSearch("Img\跳过_CG.jpg", 1716, 1002, 1920, 1080) {
                    Send {w Up}
                    Send {Shift Up}
                    
                    ; 可能由于队友不及时跳过，导致一直在按ESC
                    ; 从而导致开打后的第一时间又多按了一个ESC
                    ; 因此这里设置一定时间内只按一次ESC
                    if (A_TickCount > LastSkipCGTimeTickCount + PressEscTimeInterval) {
                        Send {Esc}
                        LastSkipCGTimeTickCount := A_TickCount
                    }
                    continue
                }

                ; 该IF必须位于检测“坚冰阴凝”之前，不然直接continue下一次循环
                if MyImageSearch("Img\返魂后传送.jpg", 1075, 633, 1187, 688) {
                    Challenging = 0
                    Send {e}
                    Sleep 2500
                    continue
                }
                
                ; 此处判断涉及中文编码方式，务必保证AHK脚本文件采用UTF8-BOM编码
                ; 参考 https://stackoverflow.com/questions/17885331/autohotkey-string-comparison
                result := PaddleOCR([901, 165, 1019-901, 199-165])          
                if (result == "通关成功") {
                    Challenging = 0

                    Send {Esc}
                    Sleep, 200

                    MyMouseClick(961, 779)
                    Sleep, 500
                    
                    if MyImageSearch("Img\已获得胜利.jpg", 626, 366, 1285, 662) {
                        Send {Space}
                    }
                    continue
                }
                
                ; 该IF必须位于检测“坚冰阴凝”之前，不然直接continue下一次循环
                result := PaddleOCR([851, 252, 1077-851, 313-252])
                if (result == "等待救援") {
                    Sleep, 1000
                    Send {e Down}
                    Sleep 4000
                    Send {e Up}
                    continue
                }
                
                result := PaddleOCR([90, 139, 181-90, 167-139])
                ; Log(result)
                
                ; 开打前
                if (result == "势比登天") {
                    Send {w Down}
                    Send {Shift Down}
                    continue
                }

                ; 开打后
                else if (result == "坚冰阴凝") {
                    ; 锁定目标
                    if (Challenging = 0) {
                        Send {~}
                        Challenging = 1
                    }
                    ; 平击
                    MouseClick
                    continue
                }

                if MyImageSearch("Img\获得头像框.jpg", 797, 881, 1063, 978) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\继续_铸就传奇界面.jpg", 897, 1028, 1024, 1069) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\放弃重生.jpg", 379, 565, 475, 608) {
                    Send {F6}
                    continue
                }

                if MyImageSearch("Img\继续_沉沙折戟界面.jpg", 886, 1027, 986, 1071) {
                    Challenging = 0
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\继续_红色按钮.jpg", 668, 980, 957, 1037) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\继续_升级恭喜获得.jpg", 800, 800, 1100, 916) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\学识点.jpg", 876, 202, 1050, 278) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\等级界面_空格跳过.jpg", 920, 415, 1002, 467) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\英雄等级界面_空格跳过.jpg", 922, 417, 992, 461) {
                    Send {Space}
                    continue
                }

                if MyImageSearch("Img\全新武技.jpg", 892, 301, 1028, 357) {
                    Send {Esc}
                    continue
                }

                if MyImageSearch("Img\白泽.jpg", 1390, 326, 1485, 390) {
                    MyMouseClick(1200, 900)
                    continue
                }

                if MyImageSearch("Img\跳过_广告.jpg", 1795, 1032, 1898, 1078) {
                    if MyImageSearch("Img\通行证任务.jpg", 1641, 134, 1722, 215) {
                        MyMouseClick(1682, 509)
                        continue
                    } else{
                        Send {Esc}
                        continue
                    }
                }
            }
        }
    }
}


Stop() {
	OnLooping = 0
}


; 引入OCR库: https://github.com/telppa/PaddleOCR-AutoHotkey/releases
; 参考: https://www.autoahk.com/archives/35526
; 注意：
; 0) 需使用中文版本的PaddleOCR-AutoHotkey_ZH.zip
; 1) 编译后的exe需要和Dll文件夹位于同一目录下
; 2) 当前AHK脚本的文件名不能包含空格

#Include PaddleOCR.ahk


; ***********快捷键***********

F10::
	Run()
Return

F12::
	Stop()
Return