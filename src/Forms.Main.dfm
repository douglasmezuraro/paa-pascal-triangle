object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 325
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Output: TMemo
    Left = 8
    Top = 45
    Width = 430
    Height = 272
    Lines.Strings = (
      'Output')
    TabOrder = 0
  end
  object InputEdit: TEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'InputEdit'
  end
  object Button: TButton
    Left = 135
    Top = 14
    Width = 75
    Height = 25
    Action = ActionCalculate
    TabOrder = 2
  end
  object ActionList1: TActionList
    Left = 376
    Top = 8
    object ActionCalculate: TAction
      Caption = 'Calcular'
      OnExecute = ActionCalculateExecute
    end
  end
end
