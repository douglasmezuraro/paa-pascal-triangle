unit Forms.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Impl.Algorithms,
  Impl.Types,
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls;

type
  TMain = class(TForm)
    Output: TMemo;
    InputEdit: TEdit;
    Button: TButton;
    ActionList: TActionList;
    ActionCalculate: TAction;
    procedure ActionCalculateExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
  public
    property Input: Integer read GetInput write SetInput;
  end;

implementation

{$R *.dfm}

procedure TMain.ActionCalculateExecute(Sender: TObject);
var
  Matrix: TMatrix;
  Line, Column: Integer;
  Element, Elements: string;
begin
  Output.Clear;
  Matrix := TAlgorithms.DynPascal(Input);
  for Line := Low(Matrix) to High(Matrix) do
  begin
    Elements := string.Empty;
    for Column := Low(Matrix) to High(Matrix) do
    begin
      Element := Format('[%d]', [Matrix[Line][Column]]);
      Elements := Elements + Element;
    end;
    Output.Lines.Insert(Line, Elements);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  Input := 0;
  Output.Clear;
  InputEdit.SetFocus;
end;

function TMain.GetInput: Integer;
begin
  Result := StrToIntDef(InputEdit.Text, 0);
end;

procedure TMain.SetInput(const Value: Integer);
begin
  InputEdit.Text := Value.ToString;
end;

end.

