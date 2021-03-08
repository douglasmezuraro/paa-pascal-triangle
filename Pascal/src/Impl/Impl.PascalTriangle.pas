unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix, System.Math, System.SysUtils;

type
  TPascalTriangle = class sealed
  strict private
    FMatrix: TMatrix;
    type TEdge = (Index, Value);
    const Edge: array[TEdge] of Byte = (0, 1);
  private
    function Pascal(const ARow, AColumn: Integer; const AMatrix: TMatrix): Integer; overload;
    function Pascal(const ASize: Integer): TMatrix; overload;
  public
    constructor Create(const ASize: Integer);
    function ToArray: TArray<TArray<Integer>>;
    function ToString: string; override;
  end;

implementation

constructor TPascalTriangle.Create(const ASize: Integer);
begin
  if ASize < 1 then
  begin
    raise EArgumentException.Create('The pascal triangle size must be positive.');
  end;

  FMatrix := Pascal(ASize);
end;

function TPascalTriangle.Pascal(const ASize: Integer): TMatrix;
var
  LMatrix: TMatrix;
  LRow, LColumn: Integer;
begin
  LMatrix := TMatrix.Create(ASize, ASize);

  for LRow := 0 to LMatrix.Rows - 1 do
  begin
    for LColumn := 0 to (LMatrix.Columns - 1) - LRow do
    begin
      LMatrix.Value[LRow, LColumn] := Pascal(LRow, LColumn, LMatrix);
    end;
  end;

  Result := LMatrix;
end;

function TPascalTriangle.Pascal(const ARow, AColumn: Integer; const AMatrix: TMatrix): Integer;
begin
  if AMatrix.Value[ARow, AColumn] <> 0 then
  begin
    Exit(AMatrix.Value[ARow, AColumn]);
  end;

  if Edge[Index] in [ARow, AColumn] then
  begin
    Exit(Edge[Value]);
  end;

  Result := Pascal(ARow, Pred(AColumn), AMatrix) + Pascal(Pred(ARow), AColumn, AMatrix);
end;

function TPascalTriangle.ToArray: TArray<TArray<Integer>>;
begin
  Result := FMatrix.ToArray;
end;

function TPascalTriangle.ToString: string;
var
  LIndex, LMaxValue: Integer;
begin
  LIndex := System.Math.Ceil(FMatrix.Rows / 2) - 1;
  LMaxValue := FMatrix.Value[LIndex, LIndex];

  Result := FMatrix.ToString(LMaxValue.ToString.Length);
end;

end.

