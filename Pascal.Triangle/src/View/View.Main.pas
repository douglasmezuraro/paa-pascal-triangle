unit View.Main;

interface

uses
  System.SysUtils, System.Classes, FMX.Types, FMX.Forms, FMX.ActnList, FMX.StdCtrls, FMX.Edit,
  Impl.PascalTriangle, Impl.Matrix, FMX.Grid, Impl.Helper, FMX.Ani, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, System.Actions, FMX.Controls, FMX.Controls.Presentation;

type
  TMain = class sealed(TForm)
    Panel: TPanel;
    EditInput: TEdit;
    ButtonCalculate: TButton;
    ActionList: TActionList;
    ActionCalculate: TAction;
    GridOutput: TStringGrid;
    procedure ActionCalculateExecute(Sender: TObject);
  private
    FMatrix: TMatrix;
    procedure Calculate;
  end;

implementation

{$R *.fmx}

procedure TMain.ActionCalculateExecute(Sender: TObject);
begin
  Calculate;
end;

procedure TMain.Calculate;
var
  Input: UInt8;
begin
  Input := StrToUIntDef(EditInput.Text, UInt8.MinValue);
  if Input <> FMatrix.Size then
  begin
    FMatrix := TPascalTriangle.Pascal(Input);
    GridOutput.FromMatrix(FMatrix);
  end;
end;

end.

