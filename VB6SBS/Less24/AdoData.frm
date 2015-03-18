VERSION 5.00
Object = "{67397AA1-7FB1-11D0-B148-00A0C922E820}#6.0#0"; "MSADODC.OCX"
Begin VB.Form Form1 
   Caption         =   "ADO Control"
   ClientHeight    =   3885
   ClientLeft      =   2805
   ClientTop       =   2415
   ClientWidth     =   4965
   LinkTopic       =   "Form1"
   ScaleHeight     =   3885
   ScaleWidth      =   4965
   Begin VB.ListBox List1 
      Height          =   1035
      Left            =   1320
      TabIndex        =   4
      Top             =   2400
      Width           =   2295
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Previous"
      Height          =   375
      Left            =   2520
      TabIndex        =   3
      Top             =   1560
      Width           =   975
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Next"
      Height          =   375
      Left            =   1440
      TabIndex        =   2
      Top             =   1560
      Width           =   975
   End
   Begin VB.TextBox Text2 
      DataField       =   "PhoneNumber"
      DataSource      =   "Adodc1"
      Height          =   405
      Left            =   2520
      TabIndex        =   1
      Text            =   "Text2"
      Top             =   960
      Width           =   1695
   End
   Begin VB.TextBox Text1 
      DataField       =   "LastName"
      DataSource      =   "Adodc1"
      Height          =   405
      Left            =   720
      TabIndex        =   0
      Text            =   "Text1"
      Top             =   960
      Width           =   1695
   End
   Begin MSAdodcLib.Adodc Adodc1 
      Height          =   330
      Left            =   1320
      Top             =   120
      Width           =   2295
      _ExtentX        =   4048
      _ExtentY        =   582
      ConnectMode     =   0
      CursorLocation  =   3
      IsolationLevel  =   -1
      ConnectionTimeout=   15
      CommandTimeout  =   30
      CursorType      =   3
      LockType        =   3
      CommandType     =   2
      CursorOptions   =   0
      CacheSize       =   50
      MaxRecords      =   0
      BOFAction       =   0
      EOFAction       =   1
      ConnectStringType=   3
      Appearance      =   1
      BackColor       =   -2147483643
      ForeColor       =   -2147483640
      Orientation     =   0
      Enabled         =   -1
      Connect         =   "DSN=Student Records"
      OLEDBString     =   ""
      OLEDBFile       =   ""
      DataSourceName  =   "Student Records"
      OtherAttributes =   ""
      UserName        =   ""
      Password        =   ""
      RecordSource    =   "Students"
      Caption         =   "Students.mdb"
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      _Version        =   393216
   End
   Begin VB.Label Label2 
      Caption         =   "Double-click a field to save all entries in text file."
      Height          =   255
      Left            =   840
      TabIndex        =   6
      Top             =   2160
      Width           =   3495
   End
   Begin VB.Label Label1 
      Caption         =   "Total records: "
      Height          =   255
      Left            =   1680
      TabIndex        =   5
      Top             =   600
      Width           =   2175
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command1_Click()

'If not already at last record, move to next
If Not Adodc1.Recordset.EOF Then
    Adodc1.Recordset.MoveNext
End If

End Sub

Private Sub Command2_Click()

'If not already at first record, move to previous
If Not Adodc1.Recordset.BOF Then
    Adodc1.Recordset.MovePrevious
End If

End Sub

Private Sub Form_Load()

'Populate list box with field names
For i = 1 To Adodc1.Recordset.Fields.Count - 1
    List1.AddItem Adodc1.Recordset.Fields(i).Name
Next i

'Display total number of records
Label1.Caption = "Total records: " & _
    Adodc1.Recordset.RecordCount

End Sub

Private Sub List1_DblClick()

'Create constant to hold text file name
Const myFile = "c:\vb6sbs\less24\names.txt"

'Open file for Append (to support multiple fields)
Open myFile For Append As #1
Print #1, String$(30, "-")  'print dashed line

Adodc1.Recordset.MoveFirst  'move to first record
x = List1.ListIndex + 1     'get item clicked

'For each record in database, write field to disk
For i = 1 To Adodc1.Recordset.RecordCount
    Print #1, Adodc1.Recordset.Fields(x).Value
    Adodc1.Recordset.MoveNext
Next i

'Print success message and close file
MsgBox Adodc1.Recordset.Fields(x).Name & _
    " field written to " & myFile
Close #1
Adodc1.Recordset.MoveFirst

End Sub
