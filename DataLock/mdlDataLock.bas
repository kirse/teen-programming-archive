Attribute VB_Name = "mdlDataLock"
Option Explicit
Dim PassChar(1 To 51) As String         ' up to 50 character key
Dim keyLen As Integer                   ' length of that key
Dim keyActual As String                 ' used for decryption, etc.

Function EncryptData(ByVal Data As String) As String
    Dim tempString1 As String           ' the temporary data holder
    Dim combinedChars As String         ' the final combination of chars
    Dim tempChar As String              ' temporary character (grabbed 1 by 1)
    Dim buildUpString As String         ' the final built up string
    Dim tempKeyChar As String           ' temporary encrypted character of the key
    Dim tempKeyActual As String         ' the actual encrypted key
    
    Dim DataLen As Double               ' total length of the data
    Dim i As Double                     ' loop variable
    Dim curKeyCodeVal As Byte           ' used to track what key bit goes with what
                                        '   character
    
    If (keyLen <= 1 Or keyLen > 50) Then
        Exit Function
    End If
    
    curKeyCodeVal = 1
    DataLen = Len(Data)
    tempString1 = Data
    
    If Len(keyActual) < 10 Then         ' here we assign a length to the key and
                                        ' store it at the front of the data.
        tempKeyActual = "0" & Len(keyActual) & keyActual
        buildUpString = tempKeyActual & buildUpString
    Else
        buildUpString = Len(keyActual) & keyActual & buildUpString
    End If
    
    frmMain.progress.Max = DataLen
    frmMain.progress.Visible = True
    
    For i = 1 To DataLen                ' encryption loop!
        If curKeyCodeVal = keyLen Then  ' used to track which key bit were using
            curKeyCodeVal = 1
        End If
        
        tempChar = Asc(Mid(tempString1, i, 1))
                                        ' get the characters one by one
        tempKeyChar = HexToDec(PassChar(curKeyCodeVal))
                                        ' get encrypted key bits one by one
        
        '**************************
        ' PAD THE DATA - so that there will be a combination of six numbers
        '                which always is 5 characters when hexed
        '*******************************************************************
        If (Len(tempChar) = 2) Then
            Select Case Val(tempChar)
                Case 0
                    tempChar = tempChar & "09"
                ' SPECIAL CASES ************************
                    Case 1
                        tempChar = "721"
                    Case 2
                        tempChar = "731"
                    Case 10
                        tempChar = "741"
                    Case 11
                        tempChar = "751"
                    Case 12
                        tempChar = "761"
                    Case 13
                        tempChar = "771"
                    Case 14
                        tempChar = "781"
                    Case 15
                        tempChar = "791"
                    Case 16
                        tempChar = "801"
                    Case 17
                        tempChar = "811"
                    Case 18
                        tempChar = "821"
                    Case 19
                        tempChar = "831"
                    Case 20
                        tempChar = "841"
                    Case 21
                        tempChar = "851"
                    Case 22
                        tempChar = "861"
                    Case 23
                        tempChar = "871"
                    Case 24
                        tempChar = "881"
                    Case 25
                        tempChar = "891"
                Case 3 To 9
                    tempChar = tempChar & "09"
                Case 26 To 32
                    tempChar = tempChar & "3"
                Case 33 To 71
                    tempChar = tempChar & "0"
                Case 72 To 84
                    tempChar = tempChar & "6"
                Case 85 To 99
                    tempChar = tempChar & "2"
            End Select
        End If
        
        If (Len(tempKeyChar) = 2) Then
            Select Case Val(tempKeyChar)
                Case 0 To 9
                    tempKeyChar = tempKeyChar & "05"
                Case 10
                    tempKeyChar = tempKeyChar & "2"
                Case 11 To 16
                    tempKeyChar = tempKeyChar & "7"
                Case 17 To 32
                    tempKeyChar = tempKeyChar & "1"
                Case 33 To 35
                    tempKeyChar = tempKeyChar & "6"
                Case 36 To 45
                    tempKeyChar = tempKeyChar & "3"
                Case 46 To 61
                    tempKeyChar = tempKeyChar & "4"
                Case 62 To 83
                    tempKeyChar = tempKeyChar & "9"
                Case 84 To 89
                    tempKeyChar = tempKeyChar & "5"
                Case 90 To 99
                    tempKeyChar = tempKeyChar & "8"
            End Select
        End If
         
        combinedChars = Hex(tempChar & tempKeyChar)     ' hex the 6 char combination:
                                                        ' the text char and key char
        buildUpString = buildUpString & combinedChars
                                                        ' continue building the encrypted
                                                        ' string
        
        curKeyCodeVal = curKeyCodeVal + 1               ' keeps track of the key bit were
                                                        ' on
        frmMain.progress.Value = i
    Next i
    
    EncryptData = buildUpString                         ' return value
    frmMain.progress.Value = frmMain.progress.Min
    frmMain.progress.Visible = False
End Function

Function DecryptData(ByVal Data As String) As String
    Dim fiveDataBit As String       ' the 5-char hexed string we initially got from a
                                    ' 6-char combination
    Dim sixDataBit As String        ' the 6-char combination (5-char "deHexed")
    Dim deCombinedChar As String    ' the 3 digit code for the text character
    Dim tempString As String        ' string with decrypted data
    Dim actualChar As String        ' the final character, builds onto tempString
    Dim keyLen As String            ' needed for Mid function, determines key
                                    ' in data
    
    keyLen = Mid(Data, 1, 2)        ' length of key is in first 2 chars of data
    
    Dim i As Integer                ' loop variable
    
    frmMain.progress.Max = Len(Data)
    frmMain.progress.Visible = True
    
    For i = (keyLen + 3) To Len(Data) Step 5
                                    ' get the first five-char data "chunk"
        fiveDataBit = Mid(Data, i, 5)
        sixDataBit = HexToDec(fiveDataBit)
                                    ' convert it to six-char ("deHex" it)
        deCombinedChar = Mid(sixDataBit, 1, 3)
                                    ' get the first 3 chars of that six-char combo,
                                    '   as they represent certain ASCII values
        
        Select Case deCombinedChar  ' brute force case statement to
                                    '   get all ascii values that have been padded
            Case Is = "009", 309, 409, 509, 609, 709, 809, 909
                deCombinedChar = Left(deCombinedChar, 1)
            Case Is = 253, 263, 273, 283, 293, 303, 313, 323, 330, 340, 350, 360, 370, 380, 390, 400, 410, 420, 430, 440, 450, 460, 470, 480, 490, 500, 510, 520, 530, 540, 550, 560, 570, 580, 590, 600, 610, 620, 630, 640, 650, 660, 670, 680, 690, 700, 710, 726, 736, 746, 756, 766, 776, 786, 796, 806, 816, 826, 836, 846, 852, 862, 872, 882, 892, 902, 912, 922, 932, 942, 952, 962, 972, 982, 992
                deCombinedChar = Left(deCombinedChar, 2)
                
            '**************************************
            '       COVERING SPECIAL ASCII CASES
            '**************************************
            Case Is = "721"
                deCombinedChar = "1"
            Case Is = "731"
                deCombinedChar = "2"
            Case Is = "741"
                deCombinedChar = "10"
            Case Is = "751"
                deCombinedChar = "11"
            Case Is = "761"
                deCombinedChar = "12"
            Case Is = "771"
                deCombinedChar = "13"
            Case Is = "781"
                deCombinedChar = "14"
            Case Is = "791"
                deCombinedChar = "15"
            Case Is = "801"
                deCombinedChar = "16"
            Case Is = "811"
                deCombinedChar = "17"
            Case Is = "821"
                deCombinedChar = "18"
            Case Is = "831"
                deCombinedChar = "19"
            Case Is = "841"
                deCombinedChar = "20"
            Case Is = "851"
                deCombinedChar = "21"
            Case Is = "861"
                deCombinedChar = "22"
            Case Is = "871"
                deCombinedChar = "23"
            Case Is = "881"
                deCombinedChar = "24"
            Case Is = "891"
                deCombinedChar = "25"
            Case Else
                deCombinedChar = deCombinedChar
        End Select
        
        actualChar = Chr(deCombinedChar)
                                    ' convert ASCII to character
            
        tempString = tempString & actualChar
                                    ' build up the string
        frmMain.progress.Value = i
    Next i
    
    DecryptData = tempString        ' send out decrypted string
    frmMain.progress.Value = frmMain.progress.Min
    frmMain.progress.Visible = False
End Function

Public Sub KeyCode(Key As String)
    Dim i As Integer
    Dim ascChar As Integer
    
    If keyActual <> "" Then         ' have to do this so user can encrypt
        keyActual = ""              ' data over and over with the same key
    End If                          ' otherwise, keys build on top of keys
    
    keyLen = Len(Key)               ' length of the key...
    
                                    ' make sure dumb user entered proper key
    If (keyLen < 1) Then
        MsgBox "You must have an Encryption Key in order to encrypt data!", vbExclamation, "Key Length"
        Exit Sub
    End If
    
    If (keyLen > 50) Then
        MsgBox "Your key must be less than 50 characters!", vbExclamation, "Key Length"
        Exit Sub
    End If

    For i = 1 To keyLen             ' key encryption scheme
        PassChar(i) = Mid(Key, i, 1)
                                    ' gets character by character in the key
                                    ' and encrypts it to a certain hex value
                                    ' so they are all 2-chars long
        ascChar = Asc(PassChar(i))
        PassChar(i) = Hex((255 Mod ascChar) + 32)
        keyActual = keyActual & PassChar(i)
                                    ' build up the key
    Next i
End Sub

Function KeyCheck(ByVal UserKey As String, ByVal Data As String) As Boolean
    Dim theEncKey As String
                                    ' the actual key in the data
    Dim theEncUserKey As String
                                    ' what the user entered
    Dim usersPassChars(1 To 51) As String
                                    ' encrypted version of what user entered
    
    Dim i As Integer
    Dim keyLen As Integer
    
    keyLen = Val(Mid(Data, 1, 2))
    theEncKey = Mid(Data, 3, keyLen)    ' extracting the correct key from text
    
    For i = 1 To Len(UserKey)           ' generating the encrypted version of the
                                        '  key the user has entered
        usersPassChars(i) = Mid(UserKey, i, 1)
        usersPassChars(i) = Hex((255 Mod Asc(usersPassChars(i))) + 32)
        theEncUserKey = theEncUserKey & usersPassChars(i)
    Next i
    
                                        ' making sure the keys are not only equal,
                                        '   but have the same length
    If Len(theEncUserKey) <> Len(theEncKey) Then
        KeyCheck = False
    Else
        If theEncUserKey = theEncKey Then
            KeyCheck = True
        Else
            KeyCheck = False
        End If
    End If
End Function

'**************************************************
' HexToDec function found on Planetsourcecode.com
'**************************************************
Public Function HexToDec(ByVal HexStr As String) As Double
    Dim mult As Double
    Dim DecNum As Double
    Dim ch As String
    mult = 1
    DecNum = 0

    Dim i As Integer
    For i = Len(HexStr) To 1 Step -1
        ch = Mid(HexStr, i, 1)
        If (ch >= "0") And (ch <= "9") Then
            DecNum = DecNum + (Val(ch) * mult)
        Else
            If (ch >= "A") And (ch <= "F") Then
                DecNum = DecNum + ((Asc(ch) - Asc("A") + 10) * mult)
            Else
                If (ch >= "a") And (ch <= "f") Then
                    DecNum = DecNum + ((Asc(ch) - Asc("a") + 10) * mult)
                Else
                    HexToDec = 0
                    Exit Function
                End If
            End If
        End If
        mult = mult * 16
    Next i
    HexToDec = DecNum
End Function

