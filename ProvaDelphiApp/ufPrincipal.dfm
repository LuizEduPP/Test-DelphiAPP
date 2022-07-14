object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Prova Delphi App'
  ClientHeight = 558
  ClientWidth = 970
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmMenuPrincipal
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object mmMenuPrincipal: TMainMenu
    Left = 937
    Top = 65532
    object MnTarefas: TMenuItem
      Caption = 'Tarefas'
      object mnTarefa1: TMenuItem
        Caption = 'Tarefa 1'
        OnClick = mnTarefa1Click
      end
      object mnTarefa2: TMenuItem
        Caption = 'Tarefa 2'
        OnClick = mnTarefa2Click
      end
      object mnTarefa3: TMenuItem
        Caption = 'Tarefa 3'
        OnClick = mnTarefa3Click
      end
    end
  end
end
