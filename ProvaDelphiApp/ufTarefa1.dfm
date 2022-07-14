object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'Tarefa 1'
  ClientHeight = 442
  ClientWidth = 668
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
  object lblColunas: TLabel
    Left = 30
    Top = 21
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object lblTabelas: TLabel
    Left = 211
    Top = 21
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object lblCondicoes: TLabel
    Left = 400
    Top = 21
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object lblSqlGerado: TLabel
    Left = 30
    Top = 242
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object mmoColunas: TMemo
    Left = 30
    Top = 40
    Width = 160
    Height = 185
    TabOrder = 0
  end
  object mmoTabelas: TMemo
    Left = 215
    Top = 40
    Width = 160
    Height = 185
    TabOrder = 1
  end
  object mmoCondicoes: TMemo
    Left = 400
    Top = 40
    Width = 160
    Height = 185
    TabOrder = 2
  end
  object btnGeraSQL: TButton
    Left = 578
    Top = 118
    Width = 75
    Height = 25
    Caption = 'GeraSQL'
    TabOrder = 3
    OnClick = btnGeraSQLClick
  end
  object mmoSqlGerado: TMemo
    Left = 30
    Top = 261
    Width = 623
    Height = 146
    ReadOnly = True
    TabOrder = 4
  end
  object spQuery: TspQuery
    Left = 637
    Top = 401
  end
end
