unit Forms.Main;

interface

uses
  Impl.PascalTriangle,
  Impl.Matrix,
  System.Actions,
  System.Classes,
  System.Math,
  System.SysUtils,
  Vcl.ActnList,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Grids,
  Vcl.StdCtrls, Vcl.Samples.Spin;

type
  TMain = class(TForm)
    Button: TButton;
    ActionList: TActionList;
    ActionCalculate: TAction;
    Output: TStringGrid;
    InputEdit: TSpinEdit;
    procedure ActionCalculateExecute(Sender: TObject);
  strict private
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
  private
    procedure Calculate;
    procedure FillOutput(const Matrix: TMatrix);
    procedure ClearOutput;
    procedure SetLength;
    procedure AutoFitColumns(const Matrix: TMatrix);
  public
    property Input: Integer read GetInput write SetInput;
  end;

implementation

{$R *.dfm}

procedure TMain.ActionCalculateExecute(Sender: TObject);
begin
  Calculate;
end;

function TMain.GetInput: Integer;
begin
  Result := InputEdit.Value;
end;

procedure TMain.SetInput(const Value: Integer);
begin
  InputEdit.Value := Value;
end;

procedure TMain.SetLength;
begin
  Output.ColCount := Input;
  Output.RowCount := Input;
end;

procedure TMain.Calculate;
var
  Matrix: TMatrix;
begin
  Matrix := TPascalTriangle.Pascal(Input);
  FillOutput(Matrix);
end;

procedure TMain.ClearOutput;
var
  Row: Integer;
begin
  for Row := 0 to Pred(Output.RowCount) do
  begin
    Output.Rows[Row].Clear;
  end;
end;

procedure TMain.FillOutput(const Matrix: TMatrix);
var
  Row, Column: Integer;
begin
  SetLength;
  ClearOutput;
  for Row := Low(Matrix) to High(Matrix) do
  begin
    for Column := Low(Matrix) to Pred(Input) - Row do
    begin
      Output.Cells[Column, Row] := Matrix[Row][Column].ToString;
    end;
  end;
  AutoFitColumns(Matrix);
end;

procedure TMain.AutoFitColumns(const Matrix: TMatrix);
const
  BlankWidth = 10;
  MinWidth = BlankWidth * 3;
var
  MaxElementIndex, MaxElementValue, MaxElementWidth, Size: Integer;
begin
  MaxElementIndex := Floor(Input / 2);
  MaxElementValue := Matrix[MaxElementIndex][MaxElementIndex];
  MaxElementWidth := Canvas.TextWidth(MaxElementValue.ToString);

  Size := MaxElementWidth + BlankWidth + Output.GridLineWidth;

  Output.DefaultColWidth := Max(Size, MinWidth);
  Output.DefaultRowHeight := Max(Size, MinWidth);
end;

end.

