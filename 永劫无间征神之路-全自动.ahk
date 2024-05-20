; 永劫无间 征神之路 自动跳过
; AutoHotKey文档：https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm


global SleepTimePerLoop 	    := 400
global OnLooping 			    := 0

global SleepTimePerLoopAttack   := 200
global OnLoopingAttack          := 0

global ImageZ       := "使用英雄.jpg"
global Z_X1	 	    := 1599
global Z_Y1 		:= 914
global Z_X2 		:= 1678
global Z_Y2 		:= 961
global Z_XClickPos  := 1643
global Z_YClickPos  := 941

global ImageA 	    := "ESC.jpg"
global A_X1	 	    := 1760
global A_Y1 		:= 1018
global A_X2 		:= 1920
global A_Y2 		:= 1080

global LastSkipCGTimestamp  := 0
global PressEscTimeInterval := 60   ; 秒

global ImageC 	    := "继续_铸就传奇界面.jpg"
global C_X1	 	    := 897
global C_Y1 		:= 1028
global C_X2 		:= 1024
global C_Y2 		:= 1069

global ImageD 	    := "继续_红色按钮.jpg"
global D_X1	 	    := 668
global D_Y1 		:= 980
global D_X2 		:= 957
global D_Y2 		:= 1037

global ImageE 	    := "等级界面_空格跳过.jpg"
global E_X1	 	    := 920
global E_Y1 		:= 415
global E_X2 		:= 1002
global E_Y2 		:= 467

global ImageF 	    := "开始征神.jpg"
global F_X1	 	    := 1735
global F_Y1 		:= 947
global F_X2 		:= 1896
global F_Y2 		:= 1046
global F_XClickPos  := 1700
global F_YClickPos  := 998

global ImageG       := "继续_升级恭喜获得.jpg"
global G_X1	 	    := 800
global G_Y1 		:= 800
global G_X2 		:= 1100
global G_Y2 		:= 916


; 雪满弓刀-坚冰阴凝
global Attack_X1         := 90
global Attack_Y1         := 139
global Attack_X2         := 181
global Attack_Y2         := 167


; 通关成功
global Pass_X1      := 901
global Pass_Y1      := 165
global Pass_X2      := 1019
global Pass_Y2      := 199


global ImageB 	    := "已获得胜利.jpg"
global B_X1	 	    := 626
global B_Y1 		:= 366
global B_X2 		:= 1285
global B_Y2 		:= 662
global B_XClickPos0 := 961
global B_YClickPos0 := 779


#MenuMaskKey vkFF				
; 修改默认模拟击键，否则按下win/alt松开之前，会默认触发Ctrl键
; Debug时可以使用KeyCastOW来测试具体按下什么键
; https://wyagd001.github.io/zh-cn/docs/Hotkeys.htm
; https://wyagd001.github.io/zh-cn/docs/commands/_MenuMaskKey.htm


; 日志文件路径
logFilePath := "script_log.txt"

Log(message) {
    global logFilePath
    timestamp := A_Now
    formattedMessage := "[" . timestamp . "] " . message . "`n"
    FileAppend, %formattedMessage%, %logFilePath%
}


if not A_IsAdmin
{
	MsgBox, 请使用管理员权限运行本程序。
	ExitApp
}


AutoAttack()
{
    ; 锁定攻击目标
    Send {~}
    
    OnLoopingAttack = 1
	Loop
	{
		if (OnLoopingAttack = 0)
		{
            Return
        }
        else
        {
            result := PaddleOCR([Pass_X1, Pass_Y1, Pass_X2-Pass_X1, Pass_Y2-Pass_Y1])
            ; Log(result)
            
            ; 此处判断涉及中文编码方式，务必保证ahk脚本文件采用UTF8-BOM编码
            if (result == "通关成功")
            {
                OnLoopingAttack = 0
                EscAfterSuccess()
                Return
            }
            
            else
            {
                ; 平击
                MouseClick
            }
        }

        Sleep, %SleepTimePerLoopAttack%
    }
}


EscAfterSuccess()
{
    Send {Esc}
    Sleep, 200

    MouseClick, , %B_XClickPos0%, %B_YClickPos0%
    Sleep, 500
    
    ImageSearch, FoundX, FoundY, B_X1, B_Y1, B_X2, B_Y2, *80 %ImageB%
    
    if (ErrorLevel = 2){
        MsgBox 查找图像失败，请确保%ImageB%与本程序在同一目录下
        ExitApp
    }
        
    ; 同时也没找到%ImageB%的图像
    else if (ErrorLevel = 1){
        		
    }
    
    ; 找到了%ImageB%
    else
    {
        Send {Space}
    }
}


Run()
{
	OnLooping = 1
	Loop
	{
		if (OnLooping = 0)
		{
			Return
		}
		else
		{
			pid := WinActive("ahk_exe NarakaBladepoint.exe")
			if (pid){

                ImageSearch, FoundX, FoundY, Z_X1, Z_Y1, Z_X2, Z_Y2, *80 %ImageZ%
				
                if (ErrorLevel = 2){
                    MsgBox 查找图像失败，请确保%ImageZ%与本程序在同一目录下
                    ExitApp
                }
                
                ; 没找到%ImageZ%的图像
                else if (ErrorLevel = 1){		
                  
                    ImageSearch, FoundX, FoundY, A_X1, A_Y1, A_X2, A_Y2, *80 %ImageA%
                
                    if (ErrorLevel = 2){
                        MsgBox 查找图像失败，请确保%ImageA%与本程序在同一目录下
                        ExitApp
                    }
                    
                    ; 没找到%ImageA%的图像
                    else if (ErrorLevel = 1){		
                        
                        ImageSearch, FoundX, FoundY, C_X1, C_Y1, C_X2, C_Y2, *80 %ImageC%
                    
                        if (ErrorLevel = 2){
                            MsgBox 查找图像失败，请确保%ImageC%与本程序在同一目录下
                            ExitApp
                        }
                        
                        ; 没找到%ImageC%的图像
                        else if (ErrorLevel = 1){		
                            
                            ImageSearch, FoundX, FoundY, D_X1, D_Y1, D_X2, D_Y2, *80 %ImageD%
                    
                            if (ErrorLevel = 2){
                                MsgBox 查找图像失败，请确保%ImageD%与本程序在同一目录下
                                ExitApp
                            }
                            
                            ; 没找到%ImageD%的图像
                            else if (ErrorLevel = 1){		
                                
                                ImageSearch, FoundX, FoundY, E_X1, E_Y1, E_X2, E_Y2, *80 %ImageE%
                    
                                if (ErrorLevel = 2){
                                    MsgBox 查找图像失败，请确保%ImageE%与本程序在同一目录下
                                    ExitApp
                                }
                                
                                ; 没找到%ImageE%的图像
                                else if (ErrorLevel = 1){
                                    
                                    ImageSearch, FoundX, FoundY, F_X1, F_Y1, F_X2, F_Y2, *80 %ImageF%
                                
                                    if (ErrorLevel = 2){
                                        MsgBox 查找图像失败，请确保%ImageF%与本程序在同一目录下
                                        ExitApp
                                    }
                                    
                                    ; 没找到%ImageF%的图像
                                    else if (ErrorLevel = 1){		
                                        
                                        ImageSearch, FoundX, FoundY, G_X1, G_Y1, G_X2, G_Y2, *80 %ImageG%
                                    
                                        if (ErrorLevel = 2){
                                            MsgBox 查找图像失败，请确保%ImageG%与本程序在同一目录下
                                            ExitApp
                                        }
                                        
                                        ; 没找到%ImageG%的图像
                                        else if (ErrorLevel = 1){
                                            
                                            result := PaddleOCR([Attack_X1, Attack_Y1, Attack_X2-Attack_X1, Attack_Y2-Attack_Y1])
                                            Log(result)
                                            
                                            ; 此处判断涉及中文编码方式，务必保证ahk脚本文件采用UTF8-BOM编码
                                            if (result == "坚冰阴凝")
                                            {
                                                AutoAttack()
                                            }
                                            
                                            else
                                            {
                                                ;
                                            }
                                        }

                                        ; 找到了%ImageG%
                                        else
                                        {
                                            Send {Space}
                                        }
                                    }
                                    
                                    ; 找到了%ImageF%
                                    else
                                    {
                                        MouseClick, , %F_XClickPos%, %F_YClickPos%
                                    }
                                }
                                
                                ; 找到了%ImageE%
                                else
                                {
                                    Send {Space}
                                }
                            }
                            
                            ; 找到了%ImageD%
                            else
                            {
                                Send {Space}
                            }
                        }
                        
                        ; 找到了%ImageC%
                        else
                        {
                            Send {Space}
                        }
                    }
                    
                    ; 找到了%ImageA%
                    else
                    {   
                        ; 跳过开场动画。可能由于队友不及时跳过，导致一直在按ESC
                        ; 从而导致开打后的第一时间又多按了一个ESC
                        ; 因此这里设置一定时间内只按一次ESC
                        if (A_Now > LastSkipCGTimestamp + PressEscTimeInterval) {
                            Send {Esc}
                            LastSkipCGTimestamp = A_Now
                        }
                    }
                }
                
                ; 找到了%ImageZ%
                else
                {
                    MouseClick, , %Z_XClickPos%, %Z_YClickPos%
                }
			}
		}

        Sleep, %SleepTimePerLoop%
	}
}


Stop()
{
    OnLoopingAttack = 0
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