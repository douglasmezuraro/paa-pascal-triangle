unit Impl.Matrix;

interface

type
  TRow = TArray<Integer>;
  TMatrix = TArray<TRow>;

const
  UndefinedValue = -1;

function InitializeMatrix(const Size: Integer;
  const Value: Integer = UndefinedValue): TMatrix;

implementation

function InitializeMatrix(const Size: Integer;
  const Value: Integer = UndefinedValue): TMatrix;
var
  Matrix: TMatrix;
  Row, Column: Integer;
begin
  SetLength(Matrix, Size, Size);
  for Row := Low(Matrix) to High(Matrix) do
  begin
    for Column := Low(Matrix) to High(Matrix) do
    begin
      Matrix[Row][Column] := Value;
    end;
  end;
  Result := Matrix;
end;

end.
