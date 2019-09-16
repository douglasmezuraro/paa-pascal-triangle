unit Impl.Matrix;

interface

uses
  System.SysUtils;

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
    constructor Create(const Size: Word; const Value: T);
    function AsMatrix: Matrix;
    property Value[const Row, Column: Word]: T read GetValue write SetValue;
    property Low: Word read GetLow;
    property High: Word read GetHigh;
    property Size: Word read GetSize;
  end;

  TMatrix = TMatrix<UInt64>;

implementation

{ TMatrix<T> }

function TMatrix<T>.AsMatrix: Matrix;
begin
  Result := FMatrix;
end;

constructor TMatrix<T>.Create(const Size: Word; const Value: T);
var
  Row, Column: Word;
begin
  FSize := Size;
  SetLength(FMatrix, FSize, FSize);

  if FSize = Word.MinValue then
    Exit;

  for Row := Low to High do
  begin
    for Column := Low to High do
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

