VERSION 5.00
Begin VB.Form Form2 
   Caption         =   "Definition"
   ClientHeight    =   1365
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   4905
   LinkTopic       =   "Form2"
   ScaleHeight     =   1365
   ScaleWidth      =   4905
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command2 
      Caption         =   "Print"
      Height          =   375
      Left            =   2760
      TabIndex        =   3
      Top             =   120
      Width           =   975
   End
   Begin VB.TextBox Text1 
      Height          =   495
      Left            =   1560
      TabIndex        =   2
      TabStop         =   0   'False
      Text            =   "Text1"
      Top             =   600
      Width           =   2775
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Close"
      Height          =   375
      Left            =   3840
      TabIndex        =   1
      Top             =   120
      Width           =   975
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      BeginProperty Font 
         Name            =   "Times New Roman"
         Size            =   14.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   1560
      TabIndex        =   0
      Top             =   120
      Width           =   1215
   End
   Begin VB.Image Image1 
      Height          =   855
      Left            =   240
      Picture         =   "PrintFrm.frx":0000
      Stretch         =   -1  'True
      Top             =   240
      Width           =   1095
   End
End
Attribute VB_Name = "Form2"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()
Form2.Hide
End Sub

Private Sub Command2_Click()
Printer.Print ""
Printer.FontName = "Arial"
Printer.FontSize = 18
Printer.FontBold = True
Printer.Print Label1.Caption
Printer.FontBold = False
Printer.Print Text1.Text
Printer.EndDoc
End Sub
