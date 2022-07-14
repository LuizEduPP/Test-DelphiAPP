unit uThread;

interface

uses
  System.SysUtils, Vcl.ComCtrls, Winapi.Windows, System.Classes;

type
  AThread = class(TThread)
  private
    FIntervalo: Integer;
    FPosition: Integer;
    FProgressBar: TProgressBar;

    procedure SetProgressBar(const Value: TProgressBar);
    procedure ExecuteProgress;

  protected
    procedure Execute; override;

  public
    property Intervalo: Integer read FIntervalo write FIntervalo;
    property ProgressBar: TProgressBar write SetProgressBar;

  end;

implementation

{ TThread }

procedure AThread.Execute;
var
  I: Integer;
begin
  inherited;

  for I := FProgressBar.Min to FProgressBar.Max do
  begin
    FPosition := I;
    Sleep(FIntervalo);
    Synchronize(ExecuteProgress);
  end;

  FPosition := 0;
  Synchronize(ExecuteProgress);

  Terminate;
end;

procedure AThread.ExecuteProgress;
begin
  inherited;

  FProgressBar.Position := FPosition;
end;

procedure AThread.SetProgressBar(const Value: TProgressBar);
begin
  FProgressBar := Value;
end;

end.
