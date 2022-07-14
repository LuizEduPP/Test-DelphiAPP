unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uspQuery;

type
  TfTarefa1 = class(TForm)
    mmoColunas: TMemo;
    mmoTabelas: TMemo;
    mmoCondicoes: TMemo;
    lblColunas: TLabel;
    lblTabelas: TLabel;
    lblCondicoes: TLabel;
    btnGeraSQL: TButton;
    mmoSqlGerado: TMemo;
    lblSqlGerado: TLabel;
    spQuery: TspQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGeraSQLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGeraSQLClick(Sender: TObject);
begin
  spQuery.spColunas.CommaText := mmoColunas.Lines.CommaText;
  spQuery.spTabelas.CommaText := mmoTabelas.Lines.CommaText;
  spQuery.spCondicoes.CommaText := mmoCondicoes.Lines.CommaText;

  if (spQuery.spColunas.CommaText = EmptyStr) or
     (spQuery.spTabelas.CommaText = EmptyStr) or
     (spQuery.spCondicoes.CommaText = EmptyStr) then
   raise Exception.Create('Preencha todos os campos!');


  mmoSqlGerado.Lines.Text := spQuery.GeraSQL;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa1 := nil;
end;

end.
