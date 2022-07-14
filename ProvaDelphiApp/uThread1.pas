unit uspThread;

interface

uses
  System.SysUtils, Vcl.ComCtrls, Winapi.Windows, System.Classes;

type
  TspThread = class(TThread)
  private
    FIntervalo: Integer;
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

procedure TspThread.Execute;
begin
  inherited;

  Synchronize(ExecuteProgress);
end;

procedure TspThread.ExecuteProgress;
var
  I: Integer;
begin
  inherited;

  for I := 0 to 100 do
  begin
    FProgressBar.Position := FProgressBar.Position + I;
    Sleep(FIntervalo);
  end;
end;

procedure TspThread.SetProgressBar(const Value: TProgressBar);
begin
  FProgressBar := Value;
end;

end.
