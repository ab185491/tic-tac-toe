object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 231
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 16
    Top = 8
    Width = 152
    Height = 35
    Caption = 'Tic-Tac-Toe'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 216
    Top = 32
    Width = 53
    Height = 19
    Caption = 'X'#39's turn'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 136
    Top = 171
    Width = 7
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object strngrd1: TStringGrid
    Left = 136
    Top = 64
    Width = 201
    Height = 81
    ColCount = 3
    FixedCols = 0
    RowCount = 3
    FixedRows = 0
    TabOrder = 0
    OnSelectCell = strngrd1SelectCell
  end
  object btn1: TButton
    Left = 312
    Top = 171
    Width = 75
    Height = 25
    Caption = 'Restart'
    Enabled = False
    TabOrder = 1
    OnClick = btn1Click
  end
end
