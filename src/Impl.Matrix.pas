unit Impl.Matrix;

interface

type
  TMatrix<T> = record
  private type
    Row = TArray<T>;
    Matrix = TArray<Row>;
  private
    FSize: Word;
    FMatrix: Matrix;
    function GetValue(const Row, Column: Word): T;
    function GetLow: Word;
    function GetHigh: Word;
    function GetSize: Word;
    procedure SetValue(const Row, Column: Word; const Value: T);
  public
    constructor Create(const GetSize: Word; const Value: T);
    property Value[const Row, Column: Word]: T read GetValue write SetValue;
    property Low: Word read GetLow;
    property High: Word read GetHigh;
    property Size: Word read GetSize;
  end;

  TMatrix = TMatrix<UInt64>;

implementation

{ TMatrix<T> }

constructor TMatrix<T>.Create(const GetSize: Word; const Value: T);
var
  Row, Column: Word;
begin
  FSize := GetSize;
  SetLength(FMatrix, FSize, FSize);
  for Row := GetLow to GetHigh do
  begin
    for Column := GetLow to GetHigh do
    begin
      Self.Value[Row, Column] := Value;
    end;
  end;
end;

function TMatrix<T>.GetHigh: Word;
begin
  Result := System.High(FMatrix);
end;

function TMatrix<T>.GetLow: Word;
begin
  Result := System.Low(FMatrix);
end;

function TMatrix<T>.GetSize: Word;
begin
  Result := FSize;
end;

function TMatrix<T>.GetValue(const Row, Column: Word): T;
begin
  Result := FMatrix[Row][Column];
end;

procedure TMatrix<T>.SetValue(const Row, Column: Word; const Value: T);
begin
  FMatrix[Row][Column] := Value;
end;

end.

