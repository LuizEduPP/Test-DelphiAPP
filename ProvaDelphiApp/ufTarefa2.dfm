object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'Tarefa 2'
  ClientHeight = 186
  ClientWidth = 434
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object btnIniciar: TButton
    Left = 334
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    TabOrder = 0
    OnClick = btnIniciarClick
  end
  object pbThread1: TProgressBar
    Left = 128
    Top = 35
    Width = 281
    Height = 21
    MarqueeInterval = 1
    TabOrder = 1
  end
  object pbThread2: TProgressBar
    Left = 128
    Top = 112
    Width = 281
    Height = 21
    MarqueeInterval = 1
    TabOrder = 2
  end
  object edtValorThread2: TLabeledEdit
    Left = 24
    Top = 112
    Width = 89
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor (ms) Thread 2'
    NumbersOnly = True
    TabOrder = 3
  end
  object edtValorThread1: TLabeledEdit
    Left = 24
    Top = 35
    Width = 89
    Height = 21
    EditLabel.Width = 94
    EditLabel.Height = 13
    EditLabel.Caption = 'Valor (ms) Thread 1'
    NumbersOnly = True
    TabOrder = 4
  end
end
