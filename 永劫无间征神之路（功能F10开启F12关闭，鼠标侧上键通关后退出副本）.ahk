; �����޼� ����֮· �Զ�����
; AutoHotKey�ĵ���https://wyagd001.github.io/zh-cn/docs/AutoHotkey.htm


global SleepTimePerLoop 	:= 400
global OnLooping 			:= 0


global ImageZ       := "ʹ��Ӣ��.jpg"
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

global ImageC 	    := "����_���ʹ������.jpg"
global C_X1	 	    := 897
global C_Y1 		:= 1028
global C_X2 		:= 1024
global C_Y2 		:= 1069

global ImageD 	    := "����_��ɫ��ť.jpg"
global D_X1	 	    := 668
global D_Y1 		:= 980
global D_X2 		:= 957
global D_Y2 		:= 1037

global ImageE 	    := "�ȼ�����_�ո�����.jpg"
global E_X1	 	    := 920
global E_Y1 		:= 415
global E_X2 		:= 1002
global E_Y2 		:= 467

global ImageF 	    := "��ʼ����.jpg"
global F_X1	 	    := 1735
global F_Y1 		:= 947
global F_X2 		:= 1896
global F_Y2 		:= 1046
global F_XClickPos  := 1700
global F_YClickPos  := 998


global ImageB 	    := "�ѻ��ʤ��.jpg"
global B_X1	 	    := 626
global B_Y1 		:= 366
global B_X2 		:= 1285
global B_Y2 		:= 662
global B_XClickPos0 := 961
global B_YClickPos0 := 779



#MenuMaskKey vkFF				
; �޸�Ĭ��ģ�������������win/alt�ɿ�֮ǰ����Ĭ�ϴ���Ctrl��
; Debugʱ����ʹ��KeyCastOW�����Ծ��尴��ʲô��
; https://wyagd001.github.io/zh-cn/docs/Hotkeys.htm
; https://wyagd001.github.io/zh-cn/docs/commands/_MenuMaskKey.htm


if not A_IsAdmin
{
	MsgBox, ��ʹ�ù���ԱȨ�����б�����
	ExitApp
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
                    MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageZ%�뱾������ͬһĿ¼��
                    ExitApp
                }
                
                ; û�ҵ�%ImageZ%��ͼ��
                else if (ErrorLevel = 1){		
                  
                    ImageSearch, FoundX, FoundY, A_X1, A_Y1, A_X2, A_Y2, *80 %ImageA%
                
                    if (ErrorLevel = 2){
                        MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageA%�뱾������ͬһĿ¼��
                        ExitApp
                    }
                    
                    ; û�ҵ�%ImageA%��ͼ��
                    else if (ErrorLevel = 1){		
                        
                        ImageSearch, FoundX, FoundY, C_X1, C_Y1, C_X2, C_Y2, *80 %ImageC%
                    
                        if (ErrorLevel = 2){
                            MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageC%�뱾������ͬһĿ¼��
                            ExitApp
                        }
                        
                        ; û�ҵ�%ImageC%��ͼ��
                        else if (ErrorLevel = 1){		
                            
                            ImageSearch, FoundX, FoundY, D_X1, D_Y1, D_X2, D_Y2, *80 %ImageD%
                    
                            if (ErrorLevel = 2){
                                MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageD%�뱾������ͬһĿ¼��
                                ExitApp
                            }
                            
                            ; û�ҵ�%ImageD%��ͼ��
                            else if (ErrorLevel = 1){		
                                
                                ImageSearch, FoundX, FoundY, E_X1, E_Y1, E_X2, E_Y2, *80 %ImageE%
                    
                                if (ErrorLevel = 2){
                                    MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageE%�뱾������ͬһĿ¼��
                                    ExitApp
                                }
                                
                                ; û�ҵ�%ImageE%��ͼ��
                                else if (ErrorLevel = 1){
                                    
                                    ImageSearch, FoundX, FoundY, F_X1, F_Y1, F_X2, F_Y2, *80 %ImageF%
                                
                                    if (ErrorLevel = 2){
                                        MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageF%�뱾������ͬһĿ¼��
                                        ExitApp
                                    }
                                    
                                    ; û�ҵ�%ImageF%��ͼ��
                                    else if (ErrorLevel = 1){		
                                        

                                    }
                                    
                                    ; �ҵ���%ImageF%
                                    else
                                    {
                                        MouseClick, , %F_XClickPos%, %F_YClickPos%
                                    }
                                }
                                
                                ; �ҵ���%ImageE%
                                else
                                {
                                    Send {Space}
                                }
                            }
                            
                            ; �ҵ���%ImageD%
                            else
                            {
                                Send {Space}
                            }
                        }
                        
                        ; �ҵ���%ImageC%
                        else
                        {
                            Send {Space}
                        }
                    }
                    
                    ; �ҵ���%ImageA%
                    else
                    {
                        Send {Esc}
                    }
                }
                
                ; �ҵ���%ImageZ%
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
	OnLooping = 0
}

EscAfterSuccess()
{
    Send {Esc}
    Sleep, 200

    MouseClick, , %B_XClickPos0%, %B_YClickPos0%
    Sleep, 500
    
    ImageSearch, FoundX, FoundY, B_X1, B_Y1, B_X2, B_Y2, *80 %ImageB%
    
    if (ErrorLevel = 2){
        MsgBox ����ͼ��ʧ�ܣ���ȷ��%ImageB%�뱾������ͬһĿ¼��
        ExitApp
    }
        
    ; ͬʱҲû�ҵ�%ImageB%��ͼ��
    else if (ErrorLevel = 1){
        		
    }
    
    ; �ҵ���%ImageB%
    else
    {
        Send {Space}
    }
}


; ***********��ݼ�***********

F10::
	Run()
Return

F12::
	Stop()
Return

; ͨ�سɹ�����Ҫ�ֶ��������ϼ�������������15s�Զ��˳�
XButton2::
    EscAfterSuccess()
Return