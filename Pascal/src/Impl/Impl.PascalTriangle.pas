unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix, System.Math, System.SysUtils;

type
  TPascalTriangle = class sealed
  private type
    TEdge = (Index, Value);
  private const
    Edge: array[TEdge] of Byte = (0, 1);
  strict private
    FSize: Integer;
    FMaxValue: Integer;
    FMatrix: TMatrix;
  private
    function Pascal(const ARow, AColumn: Integer; const AMatrix: TMatrix): Integer; overload;
    function Pascal(const ASize: Integer): TMatrix; overload;
  public
    constructor Create(const ASize: Integer);
    procedure Print;
  end;

implementation

constructor TPascalTriangle.Create(const ASize: Integer);
begin
  FSize := ASize;
  FMatrix := Pascal(ASize)
end;

function TPascalTriangle.Pascal(const ASize: Integer): TMatrix;
var
  LMatrix: TMatrix;
  LRow, LColumn, LValue: Integer;
begin
  LMatrix := TMatrix.Create(ASize, 0);

  if ASize < 1 then
  begin
    Exit(LMatrix);
  end;

  for LRow := LMatrix.Low to LMatrix.High do
  begin
    for LColumn := LMatrix.Low to LMatrix.High - LRow do
    begin
      LValue := Pascal(LRow, LColumn, LMatrix);
      FMaxValue := Max(LValue, FMaxValue);
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

  if (ARow = Edge[Index]) or (AColumn = Edge[Index]) then
  begin
    Exit(Edge[Value]);
  end;

  Result := Pascal(ARow, Pred(AColumn), AMatrix) + Pascal(Pred(ARow), AColumn, AMatrix);
end;

procedure TPascalTriangle.Print;
var
  LRow, LColumn, LValue: Integer;
  LValues, LBorders: string;
  Letter: string;
begin
  for LRow := FMatrix.Low to FMatrix.High do
  begin
    LValues := string.Empty;
    LBorders := string.Empty;

    for LColumn := FMatrix.Low to FMatrix.High do
    begin
      if FMatrix.Value[LRow, LColumn] > 0 then
      begin
        LValues := LValues + '|' + FMatrix.Value[LRow, LColumn].ToString.PadLeft(FMaxValue.ToString.Length);
      end;
    end;

    LValues := LValues + '|';
    for Letter in LValues do
    begin
      if Letter = '|' then
        LBorders := LBorders + '+'
      else
        LBorders := LBorders + '-';
    end;

    if LRow = 0 then
    begin
      Writeln(LBorders);
    end;

    WriteLn(LValues);
    Writeln(LBorders);
  end;
end;

end.

