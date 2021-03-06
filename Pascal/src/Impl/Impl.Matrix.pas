unit Impl.Matrix;

interface

uses
  System.SysUtils;

type
  TMatrix = record
  strict private
    FSize: Integer;
    FMatrix: TArray<TArray<Integer>>;
  private
    function GetLow: Integer;
    function GetHigh: Integer;
    function GetValue(const ARow, AColumn: Integer): Integer;
    procedure SetValue(const ARow, AColumn: Integer; const AValue: Integer);
  public
    constructor Create(const ASize: Integer; const AValue: Integer);
    property Value[const ARow, AColumn: Integer]: Integer read GetValue write SetValue;
    property Low: Integer read GetLow;
    property High: Integer read GetHigh;
    property Size: Integer read FSize;
  end;

implementation

constructor TMatrix.Create(const ASize: Integer; const AValue: Integer);
var
  LRow, LColumn: Integer;
begin
  SetLength(FMatrix, ASize, ASize);

  if FSize = 0 then
  begin
    Exit;
  end;

  FSize := ASize;
  for LRow := Low to High do
  begin
    for LColumn := Low to High do
    begin
      Value[LRow, LColumn] := AValue;
    end;
  end;
end;

function TMatrix.GetHigh: Integer;
begin
  Result := System.High(FMatrix);
end;

function TMatrix.GetLow: Integer;
begin
  Result := System.Low(FMatrix);
end;

function TMatrix.GetValue(const ARow, AColumn: Integer): Integer;
begin
  Result := FMatrix[ARow][AColumn];
end;

procedure TMatrix.SetValue(const ARow, AColumn: Integer; const AValue: Integer);
begin
  FMatrix[ARow][AColumn] := AValue;
end;

end.

