unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix, System.Math, System.SysUtils;

type
  TPascalTriangle = class sealed
  strict private
    FMatrix: TMatrix;
    FMaxValue: Integer;
    type TEdge = (Index, Value);
    const Edge: array[TEdge] of Byte = (0, 1);
  private
    function Pascal(const ARow, AColumn: Integer; const AMatrix: TMatrix): Integer; overload;
    function Pascal(const ASize: Integer): TMatrix; overload;
  public
    constructor Create(const ASize: Integer);
    function ToString: string; override;
  end;

implementation

constructor TPascalTriangle.Create(const ASize: Integer);
begin
  FMatrix := Pascal(ASize)
end;

function TPascalTriangle.Pascal(const ASize: Integer): TMatrix;
var
  LMatrix: TMatrix;
  LRow, LColumn, LValue: Integer;
begin
  LMatrix := TMatrix.Create(ASize, ZeroValue);

  if ASize < PositiveValue then
  begin
    Exit(LMatrix);
  end;

  for LRow := LMatrix.Low to LMatrix.High do
  begin
    for LColumn := LMatrix.Low to LMatrix.High - LRow do
    begin
      LValue := Pascal(LRow, LColumn, LMatrix);
      FMaxValue := System.Math.Max(LValue, FMaxValue);
      LMatrix.Value[LRow, LColumn] := LValue;
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

function TPascalTriangle.ToString: string;
begin
  Result := FMatrix.ToString(FMaxValue.ToString.Length);
end;

end.

