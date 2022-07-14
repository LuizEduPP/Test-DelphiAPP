unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls;

type
  TfTarefa2 = class(TForm)
    btnIniciar: TButton;
    pbThread1: TProgressBar;
    pbThread2: TProgressBar;
    edtValorThread2: TLabeledEdit;
    edtValorThread1: TLabeledEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIniciarClick(Sender: TObject);
  private
    procedure IniciarThread(pValorThread1, pValorThread2: Integer);
    function ExisteValorThread(pValorThread1, pValorThread2: String): Boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

uses
  uThread;

{$R *.dfm}

procedure TfTarefa2.btnIniciarClick(Sender: TObject);
var valorThread1, valorThread2: Integer;
begin
  if not ExisteValorThread(edtValorThread1.Text, edtValorThread2.Text) then
    Exit;

  valorThread1 := StrToInt(edtValorThread1.Text);
  valorThread2 := StrToInt(edtValorThread2.Text);

  IniciarThread(valorThread1, valorThread2);
end;

function TfTarefa2.ExisteValorThread(pValorThread1, pValorThread2: String): Boolean;
begin
  Result := True;

  if pValorThread1.IsEmpty or pValorThread2.IsEmpty then
    Result := False;
end;

procedure TfTarefa2.IniciarThread(pValorThread1, pValorThread2: Integer);
var
  LThread1, LThread2: AThread;
begin
  LThread1 := AThread.Create(True);
  LThread1.FreeOnTerminate := True;
  LThread1.Intervalo := pValorThread1;
  LThread1.ProgressBar := pbThread1;
  LThread1.Start;

  LThread2 := AThread.Create(True);
  LThread2.FreeOnTerminate := True;
  LThread2.Intervalo := pValorThread2;
  LThread2.ProgressBar := pbThread2;
  LThread2.Start;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa2 := nil;
end;

end.
