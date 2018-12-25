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
    FMatrix: TIntegerMatrix;
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
  private
    procedure Calculate;
    procedure SetUpOutput;
    procedure FillOutput;
    procedure AutoFitColumns;
  public
    property Input: Integer read GetInput write SetInput;
    property Matrix: TIntegerMatrix read FMatrix write FMatrix;
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
begin
  Matrix := TPascalTriangle.Pascal(Input);
  FillOutput;
end;

procedure TMain.SetUpOutput;
var
  Row: Integer;
begin
  Output.ColCount := Matrix.High;
  Output.RowCount := Matrix.High;

  for Row := Matrix.Low to Matrix.High do
    Output.Rows[Row].Clear;
end;

procedure TMain.FillOutput;
var
  Row, Column: Integer;
begin
  SetUpOutput;
  for Row := Matrix.Low to Matrix.High do
  begin
    for Column := Matrix.Low to Pred(Matrix.High) - Row do
    begin
      Output.Cells[Column, Row] := Matrix.Value[Row, Column].ToString;
    end;
  end;
  AutoFitColumns;
end;

procedure TMain.AutoFitColumns;
const
  BlankWidth = 10;
  MinWidth = BlankWidth * 3;
var
  Index, Value, Width: Integer;
begin
  Index := Floor(Matrix.High / 2);
  Value := Matrix.Value[Index, Index];
  Width := Canvas.TextWidth(Value.ToString);

  Width := Width + BlankWidth + Output.GridLineWidth;

  Output.DefaultColWidth := Max(Width, MinWidth);
  Output.DefaultRowHeight := Max(Width, MinWidth);
end;

end.

