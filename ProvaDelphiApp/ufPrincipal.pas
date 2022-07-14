unit ufPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TFrmPrincipal = class(TForm)
    mmMenuPrincipal: TMainMenu;
    MnTarefas: TMenuItem;
    mnTarefa1: TMenuItem;
    mnTarefa2: TMenuItem;
    mnTarefa3: TMenuItem;
    procedure mnTarefa1Click(Sender: TObject);
    procedure mnTarefa2Click(Sender: TObject);
    procedure mnTarefa3Click(Sender: TObject);
  private
    procedure CriarFormulario(AClass: TFormClass; AForm: TForm);
  public

  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses
  ufTarefa1, ufTarefa2, ufTarefa3;

{$R *.dfm}

procedure TFrmPrincipal.CriarFormulario(AClass: TFormClass; AForm: TForm);
begin
  try
    if not Assigned(AForm) then
    begin
      Application.CreateForm(AClass, AForm);
    end;

    AForm.Show;
  except
    raise Exception.Create('Erro ao abrir formulário!');
  end;
end;

procedure TFrmPrincipal.mnTarefa1Click(Sender: TObject);
begin
  CriarFormulario(TfTarefa1, fTarefa1);
end;

procedure TFrmPrincipal.mnTarefa2Click(Sender: TObject);
begin
  CriarFormulario(TfTarefa2, fTarefa2);
end;

procedure TFrmPrincipal.mnTarefa3Click(Sender: TObject);
begin
  CriarFormulario(TfTarefa3, fTarefa3);
end;

end.
