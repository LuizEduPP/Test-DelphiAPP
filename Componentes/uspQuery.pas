unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }
    FspCondicoes: TStringList;
    FspColunas: TStringList;
    FspTabelas: TStringList;
    procedure SetCondicoesList(Value: TStringList);
    procedure SetColunasList(Value: TStringList);
    procedure SetTabelasList(Value: TStringList);
  protected
    { Protected declarations }
  public
    { Public declarations }
    function GeraSQL: String;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
    property spCondicoes: TStringList read FspCondicoes write SetCondicoesList;
    property spColunas: TStringList read FspColunas write SetColunasList;
    property spTabelas: TStringList read FspTabelas write SetTabelasList;
  end;

procedure register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

{ TspQuery }

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FspCondicoes := TStringList.Create;
  FspColunas := TStringList.Create;
  FspTabelas := TStringList.Create;

  spColunas.Delimiter := ',';
  spColunas.StrictDelimiter := True;
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;

  inherited;
end;

function TspQuery.GeraSQL: String;
var
  i: Integer;
  AGeraSQL: String;
begin
  AGeraSQL := Format('SELECT %s', [spColunas.DelimitedText]) + #13#10 + Format('FROM %s', [spTabelas.Text]);

  for i := 0 to spCondicoes.Count - 1 do
  begin
    if i = 0 then
      AGeraSQL := AGeraSQL + Format('WHERE %s ', [spCondicoes[i]])
    else if i >= 1 then
      AGeraSQL := AGeraSQL + Format('AND %s ', [spCondicoes[i]])
  end;

  Result := AGeraSQL;
end;

procedure TspQuery.SetColunasList(Value: TStringList);
begin
  FspColunas.Assign(Value);
end;

procedure TspQuery.SetCondicoesList(Value: TStringList);
begin
  FspCondicoes.Assign(Value);
end;

procedure TspQuery.SetTabelasList(Value: TStringList);
begin
  FspTabelas.Assign(Value);
end;

end.
