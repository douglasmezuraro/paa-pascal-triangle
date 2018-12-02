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
  System.Actions,
  Vcl.ActnList,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Output: TMemo;
    InputEdit: TEdit;
    Button: TButton;
    ActionList1: TActionList;
    ActionCalculate: TAction;
    procedure ActionCalculateExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
  public
    property Input: Integer read GetInput write SetInput;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ActionCalculateExecute(Sender: TObject);
var
  Matrix: TMatrix;
  Line: TLine;
begin
  Matrix := TAlgorithms.Pascal(Input);

  for Line in Matrix do
  begin
    Output.Lines.Add(string.Join(' ', Line));
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Input := 0;
  Output.Clear;
end;

function TForm1.GetInput: Integer;
begin
  Result := StrToIntDef(InputEdit.Text, 0);
end;

procedure TForm1.SetInput(const Value: Integer);
begin
  InputEdit.Text := Value.ToString;
end;

end.
