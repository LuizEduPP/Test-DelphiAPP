unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Datasnap.DBClient, Vcl.Mask;

type
  TipoTotal = (tpTotal, tpDivisao);

  TfTarefa3 = class(TForm)
    dbgValoresProjeto: TDBGrid;
    lblValoresProjeto: TLabel;
    btnTotal: TButton;
    btnTotalDivisoes: TButton;
    edtTotal: TEdit;
    edtTotalDivisoes: TEdit;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
  private
    { Private declarations }
    FcdsValoresProjeto: TClientDataSet;
    FdsValoresProjeto: TDataSource;

    procedure CriarColunas;
    procedure PopularDados;

    function ObterTotais(ATipoTotal: TipoTotal): String;
  public
    { Public declarations }
  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
  edtTotal.Text := ObterTotais(tpTotal);
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
  edtTotalDivisoes.Text := ObterTotais(tpDivisao);
end;

procedure TfTarefa3.CriarColunas;
begin
  FcdsValoresProjeto := TClientDataSet.Create(nil);
  FcdsValoresProjeto.FieldDefs.Add('IDPROJETO', ftInteger);
  FcdsValoresProjeto.FieldDefs.Add('NOMEPROJETO', ftString, 40);
  FcdsValoresProjeto.FieldDefs.Add('VALOR', ftCurrency);
  FcdsValoresProjeto.CreateDataSet;

  FdsValoresProjeto := TDataSource.Create(nil);
  FdsValoresProjeto.DataSet := FcdsValoresProjeto;

  dbgValoresProjeto.DataSource := FdsValoresProjeto;
  dbgValoresProjeto.Columns[0].FieldName := 'IDPROJETO';
  dbgValoresProjeto.Columns[1].FieldName := 'NOMEPROJETO';
  dbgValoresProjeto.Columns[2].FieldName := 'VALOR';
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FcdsValoresProjeto);
  FreeAndNil(FdsValoresProjeto);

  Action := caFree;
  fTarefa3 := nil;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  CriarColunas;
  PopularDados;
end;

function TfTarefa3.ObterTotais(ATipoTotal: TipoTotal): String;
var
  pValorTotal, pValorTotalAnt: Currency;
begin
  try
    pValorTotal := 0;
    pValorTotalAnt := 0;

    FcdsValoresProjeto.DisableControls;
    FcdsValoresProjeto.First;
    while not FcdsValoresProjeto.Eof do
    begin
      case ATipoTotal of
        tpTotal: pValorTotal := pValorTotal + FcdsValoresProjeto.Fields[2].AsCurrency;
        tpDivisao: begin
                     if pValorTotalAnt <> 0 then
                       pValorTotal := pValorTotal + FcdsValoresProjeto.Fields[2].AsCurrency / pValorTotalAnt;

                       pValorTotalAnt := FcdsValoresProjeto.Fields[2].AsCurrency;
                   end;
      end;

      FcdsValoresProjeto.Next;
    end;
  finally
    FcdsValoresProjeto.EnableControls;
  end;

  Result := FormatFloat('#,,0.00', pValorTotal);
end;

procedure TfTarefa3.PopularDados;
var
  AIndice: Integer;
begin
  for AIndice := 1 to 10 do
  begin
    FcdsValoresProjeto.Append;
    FcdsValoresProjeto.FieldByName('IDPROJETO').AsInteger := AIndice;
    FcdsValoresProjeto.FieldByName('NOMEPROJETO').AsString := Format('Projeto %s', [IntToStr(AIndice)]);
    FcdsValoresProjeto.FieldByName('VALOR').AsCurrency := AIndice*10;
    FcdsValoresProjeto.Post;
  end;

  FcdsValoresProjeto.IndexFieldNames := 'IDPROJETO';
end;

end.