VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   3195
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4680
   LinkTopic       =   "Form1"
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   StartUpPosition =   3  'Windows Default
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
Prompt = "Introduzca una temperatura Fahrenheit."
Do
    TempF = InputBox(Prompt, "Fahrenheit a Celsius")
    If TempF <> "" Then
        Celsius = Int((TempF + 40) * 5 / 9 - 40)
        MsgBox (Celsius), , "Temperatura en Celsius"
    End If
Loop While TempF <> ""
End
End Sub
