unit Impl.Helper;

interface

uses
  FMX.Controls, FMX.Graphics, FMX.Grid, Impl.Matrix, System.SysUtils, System.Math;

type
  TStringGridHelper = class Helper for TStringGrid
  private
    procedure AddColumns(const Count: UInt8; const Width: Single);
    procedure Setup(const Matrix: TMatrix);
    procedure Fill(const Matrix: TMatrix);
    function GetSize(const Matrix: TMatrix): Single;
  public
    procedure FromMatrix(const Matrix: TMatrix);
  end;

implementation

{ TStringGridHelper }

procedure TStringGridHelper.AddColumns(const Count: UInt8; const Width: Single);
var
  Column: TIntegerColumn;
begin
  while ColumnCount <> Count do
  begin
    Column := TIntegerColumn.Create(Self);
    Column.Width := Width;
    AddObject(Column);
  end;
end;

procedure TStringGridHelper.Fill(const Matrix: TMatrix);
var
  LRow, LColumn: Integer;
begin
  for LRow := Matrix.Low to Matrix.High do
  begin
    for LColumn := Matrix.Low to Matrix.High - LRow do
    begin
      Cells[LColumn, LRow] := Matrix.Value[LRow, LColumn].ToString;
    end;
  end;
end;

function TStringGridHelper.GetSize(const Matrix: TMatrix): Single;
const
  BlankSize = 10;
  MinSize = BlankSize * 3;
var
  Value: UInt64;
  Index: Integer;
  Size: Single;
begin
  Index := Floor(Matrix.High / 2);
  Value := Matrix.Value[Index, Index];
  Size := Canvas.TextWidth(Value.ToString) + BlankSize;

  Result := Max(Size, MinSize);
end;

procedure TStringGridHelper.FromMatrix(const Matrix: TMatrix);
begin
  Setup(Matrix);
  Fill(Matrix);
end;

procedure TStringGridHelper.Setup(const Matrix: TMatrix);
begin
  ClearColumns;
  RowCount := Matrix.Size;
  RowHeight := GetSize(Matrix);
  AddColumns(Matrix.Size, RowHeight);
end;

end.
