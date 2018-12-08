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
  Line: TLine;
begin
  Output.Clear;

  Matrix := TAlgorithms.Pascal(Input);

  for Line in Matrix do
  begin
    Output.Lines.Add(string.Join(' ', Line));
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

