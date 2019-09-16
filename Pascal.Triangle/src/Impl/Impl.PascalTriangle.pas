unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix, System.SysUtils;

type
  TPascalTriangle = class sealed
  private type
    TEdge = (Index, Value);
  private const
    UndefinedValue = UInt64.MinValue;
    Edge: array[TEdge] of Byte = (0, 1);
  private
    class function Pascal(const Row, Column: UInt64; const Matrix: TMatrix): UInt64; overload;
  public
    class function Pascal(const Size: UInt64): TMatrix; overload;
  end;

implementation

{ TPascalTriangle }

class function TPascalTriangle.Pascal(const Size: UInt64): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: UInt64;
begin
  Matrix := TMatrix.Create(Size, UndefinedValue);

  if Size = UInt64.MinValue then
    Exit(Matrix);

  for Row := Matrix.Low to Matrix.High do
  begin
    for Column := Matrix.Low to Matrix.High - Row do
    begin
      Matrix.Value[Row, Column] := Pascal(Row, Column, Matrix);
    end;
  end;

  Result := Matrix;
end;

class function TPascalTriangle.Pascal(const Row, Column: UInt64; const Matrix: TMatrix): UInt64;
begin
  if Matrix.Value[Row, Column] <> UndefinedValue then
  begin
    Exit(Matrix.Value[Row, Column]);
  end;

  if (Row = Edge[Index]) or (Column = Edge[Index]) then
  begin
    Exit(Edge[Value]);
  end;

  Result := Pascal(Row, Pred(Column), Matrix) + Pascal(Pred(Row), Column, Matrix);
end;

end.

