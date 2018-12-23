unit Form.Main;

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
  Vcl.ExtCtrls,
  Vcl.Forms,
  Vcl.Grids,
  Vcl.Samples.Spin,
  Vcl.StdCtrls;

type
  TMain = class(TForm)
    ActionList: TActionList;
    ActionCalculate: TAction;
    Output: TStringGrid;
    Panel: TPanel;
    InputEdit: TSpinEdit;
    Button: TButton;
    procedure ActionCalculateExecute(Sender: TObject);
  strict private
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
  private
    procedure Calculate;
    procedure SetUpOutput;
    procedure FillOutput(const Matrix: TIntegerMatrix);
    procedure AutoFitColumns(const Matrix: TIntegerMatrix);
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

procedure TMain.Calculate;
var
  Matrix: TIntegerMatrix;
begin
  Matrix := TPascalTriangle.Pascal(Input);
  FillOutput(Matrix);
end;

procedure TMain.SetUpOutput;
var
  Row: Integer;
begin
  Output.ColCount := Input;
  Output.RowCount := Input;

  for Row := 0 to Pred(Output.RowCount) do
    Output.Rows[Row].Clear;
end;

procedure TMain.FillOutput(const Matrix: TIntegerMatrix);
var
  Row, Column: Integer;
begin
  SetUpOutput;
  for Row := Matrix.Low to Matrix.High do
  begin
    for Column := Matrix.Low to Pred(Input) - Row do
    begin
      Output.Cells[Column, Row] := Matrix.Value[Row, Column].ToString;
    end;
  end;
  AutoFitColumns(Matrix);
end;

procedure TMain.AutoFitColumns(const Matrix: TIntegerMatrix);
const
  BlankWidth = 10;
  MinWidth = BlankWidth * 3;
var
  MaxElementIndex, MaxElementValue, MaxElementWidth, Width: Integer;
begin
  MaxElementIndex := Floor(Input / 2);
  MaxElementValue := Matrix.Value[MaxElementIndex, MaxElementIndex];
  MaxElementWidth := Canvas.TextWidth(MaxElementValue.ToString);

  Width := MaxElementWidth + BlankWidth + Output.GridLineWidth;

  Output.DefaultColWidth := Max(Width, MinWidth);
  Output.DefaultRowHeight := Max(Width, MinWidth);
end;

end.

