object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'Tarefa 3'
  ClientHeight = 452
  ClientWidth = 609
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  DesignSize = (
    609
    452)
  PixelsPerInch = 96
  TextHeight = 13
  object lblValoresProjeto: TLabel
    Left = 8
    Top = 16
    Width = 96
    Height = 13
    Caption = 'Valores por projeto:'
  end
  object lblTotal: TLabel
    Left = 480
    Top = 311
    Width = 44
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Total R$:'
    ExplicitLeft = 451
  end
  object lblTotalDivisoes: TLabel
    Left = 480
    Top = 365
    Width = 85
    Height = 13
    Anchors = [akTop, akRight]
    Caption = 'Total divis'#245'es R$:'
    ExplicitLeft = 451
  end
  object dbgValoresProjeto: TDBGrid
    Left = 8
    Top = 35
    Width = 593
    Height = 262
    Anchors = [akLeft, akTop, akRight]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        Title.Caption = 'IdProjeto'
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'NomeProjeto'
        Width = 379
        Visible = True
      end
      item
        Expanded = False
        Title.Caption = 'Valor'
        Width = 94
        Visible = True
      end>
  end
  object btnTotal: TButton
    Left = 396
    Top = 328
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = btnTotalClick
  end
  object btnTotalDivisoes: TButton
    Left = 356
    Top = 382
    Width = 115
    Height = 25
    Anchors = [akTop, akRight]
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 3
    OnClick = btnTotalDivisoesClick
  end
  object edtTotal: TEdit
    Left = 480
    Top = 330
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 2
    ExplicitLeft = 451
  end
  object edtTotalDivisoes: TEdit
    Left = 480
    Top = 384
    Width = 121
    Height = 21
    Anchors = [akTop, akRight]
    ReadOnly = True
    TabOrder = 4
    ExplicitLeft = 451
  end
end
