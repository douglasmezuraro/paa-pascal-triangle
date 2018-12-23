unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix,
  System.SysUtils;

type
  TIntegerMatrix = TMatrix<Integer>;

  TPascalTriangle = class
  private
    const UndefinedValue = -1;
    class function Pascal(const Row, Column: Integer; const Matrix: TIntegerMatrix): Integer; overload;
  public
    class function Pascal(const Size: Integer): TIntegerMatrix; overload;
  end;

implementation

{ TPascalTriangle }

class function TPascalTriangle.Pascal(const Size: Integer): TIntegerMatrix;
var
  Matrix: TIntegerMatrix;
  Row, Column: Integer;
begin
  Matrix := TIntegerMatrix.Create(Size, UndefinedValue);
  for Row := Matrix.Low to Matrix.High do
  begin
    for Column := Matrix.Low to Matrix.High do
    begin
      Matrix.Value[Row, Column] := Pascal(Row, Column, Matrix);
    end;
  end;
  Result := Matrix;
end;

class function TPascalTriangle.Pascal(const Row, Column: Integer;
  const Matrix: TIntegerMatrix): Integer;
const
  EdgeIndex = 0;
  EdgeValue = 1;
begin
  if Matrix.Value[Row, Column] <> UndefinedValue then
  begin
    Result := Matrix.Value[Row, Column];
    Exit;
  end;

  if EdgeIndex in [Row, Column] then
  begin
    Result := EdgeValue;
    Exit;
  end;

  Result := Pascal(Row, Pred(Column), Matrix) + Pascal(Pred(Row), Column, Matrix);
end;

end.

