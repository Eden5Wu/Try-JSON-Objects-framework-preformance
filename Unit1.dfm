object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 483
  ClientWidth = 843
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 19
  object Button1: TButton
    Left = 8
    Top = 248
    Width = 273
    Height = 57
    Caption = 'JSONReader with JSON Objects'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 843
    Height = 242
    Align = alTop
    TabOrder = 1
  end
  object Edit1: TEdit
    Left = 296
    Top = 263
    Width = 217
    Height = 27
    TabOrder = 2
    Text = '0'
  end
  object Edit2: TEdit
    Left = 519
    Top = 263
    Width = 316
    Height = 27
    TabOrder = 3
    Text = '0'
  end
  object Memo2: TMemo
    Left = 8
    Top = 311
    Width = 827
    Height = 164
    TabOrder = 4
  end
end
