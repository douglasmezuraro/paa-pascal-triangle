unit Impl.Algorithms;

interface

uses
  Impl.Types,
  System.Classes,
  System.Math,
  System.SysUtils;

type
  TAlgorithms = class
  private
    class function Initialize(const N: Integer): TMatrix;
  public
    { without using dynamic-programming }
    class function Pascal(const N: Integer): TMatrix; overload;
      deprecated 'Use DynPascal';
    class function Pascal(const Row, Column: Integer): Integer; overload;
      deprecated 'Use DynPascal';
    { using dynamic-programming }
    class function DynPascal(const N: Integer): TMatrix; overload;
    class function DynPascal(const Row, Column: Integer;
      const Matrix: TMatrix): Integer; overload;
  end;

implementation

{ TAlgorithms }

class function TAlgorithms.DynPascal(const N: Integer): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: Integer;
begin
  Matrix := Initialize(N);
  for Row := Low(Matrix) to High(Matrix) do
  begin
    for Column := Low(Matrix) to High(Matrix) do
    begin
      Matrix[Row][Column] := DynPascal(Row, Column, Matrix);
    end;
  end;
  Result := Matrix;
end;

class function TAlgorithms.DynPascal(const Row, Column: Integer;
  const Matrix: TMatrix): Integer;
begin
  Result := Matrix[Row][Column];

  if Result <> NegativeValue then
    Exit;

  Result := 1;

  if (Row < 1) or (Column < 1) then
    Exit;

  Result := DynPascal(Row, Pred(Column), Matrix) + DynPascal(Pred(Row), Column, Matrix);
end;

class function TAlgorithms.Initialize(const N: Integer): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: Integer;
begin
  SetLength(Matrix, N, N);
  for Row := Low(Matrix) to High(Matrix) do
  begin
    for Column := Low(Matrix) to High(Matrix) do
    begin
      Matrix[Row][Column] := NegativeValue;
    end;
  end;
  Result := Matrix;
end;

class function TAlgorithms.Pascal(const N: Integer): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: Integer;
begin
  Matrix := Initialize(N);
  for Row := 0 to Pred(N) do
  begin
    for Column := 0 to Pred(N) do
    begin
      Matrix[Row][Column] := Pascal(Row, Column);
    end;
  end;
  Result := Matrix;
end;

class function TAlgorithms.Pascal(const Row, Column: Integer): Integer;
begin
  Result := 1;

  if (Row < 1) or (Column < 1) then
    Exit;

  Result := Pascal(Row, Pred(Column)) + Pascal(Pred(Row), Column);
end;

end.

