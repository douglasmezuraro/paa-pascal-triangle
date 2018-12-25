unit Impl.Matrix;

interface

type
  TMatrix<T> = record
  private type
    Row = TArray<T>;
    Matrix = TArray<Row>;
  private
    FMatrix: Matrix;
    function GetValue(const Row, Column: Word): T;
    procedure SetValue(const Row, Column: Word; const Value: T);
  public
    constructor Create(const Size: Word; const Value: T);
    function Low: Word;
    function High: Word;
    property Value[const Row, Column: Word]: T read GetValue write SetValue;
  end;

implementation

{ TMatrix<T> }

constructor TMatrix<T>.Create(const Size: Word; const Value: T);
var
  Row, Column: Word;
begin
  SetLength(FMatrix, Size, Size);
  for Row := Low to High do
  begin
    for Column := Low to High do
    begin
      Self.Value[Row, Column] := Value;
    end;
  end;
end;

function TMatrix<T>.GetValue(const Row, Column: Word): T;
begin
  Result := FMatrix[Row][Column];
end;

function TMatrix<T>.High: Word;
begin
  Result := System.High(FMatrix);
end;

function TMatrix<T>.Low: Word;
begin
  Result := System.Low(FMatrix);
end;

procedure TMatrix<T>.SetValue(const Row, Column: Word; const Value: T);
begin
  FMatrix[Row][Column] := Value;
end;

end.

