object Main: TMain
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Segundo trabalho de PAA'
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
  object Button: TButton
    Left = 135
    Top = 14
    Width = 75
    Height = 25
    Action = ActionCalculate
    TabOrder = 1
  end
  object Output: TStringGrid
    Left = 8
    Top = 45
    Width = 784
    Height = 484
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
    ColWidths = (
      64)
  end
  object InputEdit: TSpinEdit
    Left = 8
    Top = 17
    Width = 121
    Height = 22
    MaxValue = 9999
    MinValue = 1
    TabOrder = 0
    Value = 0
  end
  object ActionList: TActionList
    Left = 376
    Top = 16
    object ActionCalculate: TAction
      Caption = '&Calcular'
      OnExecute = ActionCalculateExecute
    end
  end
end
