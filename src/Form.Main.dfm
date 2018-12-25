object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pascal Triangle'
  ClientHeight = 600
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Output: TStringGrid
    Left = 0
    Top = 35
    Width = 800
    Height = 565
    Align = alClient
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 1
    ColWidths = (
      64)
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 800
    Height = 35
    Align = alTop
    TabOrder = 0
    object InputEdit: TSpinEdit
      Left = 9
      Top = 8
      Width = 121
      Height = 22
      MaxValue = 9999
      MinValue = 1
      TabOrder = 0
      Value = 1
    end
    object Button: TButton
      Left = 136
      Top = 6
      Width = 75
      Height = 25
      Action = ActionCalculate
      Caption = '&Calculate'
      TabOrder = 1
    end
  end
  object ActionList: TActionList
    Left = 16
    Top = 88
    object ActionCalculate: TAction
      Caption = '&Calcular'
      OnExecute = ActionCalculateExecute
    end
  end
end
