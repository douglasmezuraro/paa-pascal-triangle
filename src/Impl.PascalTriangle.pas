unit Impl.PascalTriangle;

interface

uses
  Impl.Matrix,
  System.SysUtils;

type
  TPascalTriangle = class
  public
    class function Pascal(const Size: Integer): TMatrix; overload;
    class function Pascal(const Row, Column: Integer;
      const Matrix: TMatrix): Integer; overload;
  end;

implementation

{ TAlgorithms }

class function TPascalTriangle.Pascal(const Size: Integer): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: Integer;
begin
  Matrix := InitializeMatrix(Size);
  for Row := Low(Matrix) to High(Matrix) do
  begin
    for Column := Low(Matrix) to High(Matrix) do
    begin
      Matrix[Row][Column] := Pascal(Row, Column, Matrix);
    end;
  end;
  Result := Matrix;
end;

class function TPascalTriangle.Pascal(const Row, Column: Integer;
  const Matrix: TMatrix): Integer;
const
  EdgeIndex = 0;
  EdgeValue = 1;
begin
  if Matrix[Row][Column] <> UndefinedValue then
  begin
    Result := Matrix[Row][Column];
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

