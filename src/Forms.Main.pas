unit Forms.Main;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.Math,
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
    FMatrix: TMatrix;
    function FormatElement(const Element: Integer): string;
    function LengthOfHighestElement: Integer;
    function GetInput: Integer;
    procedure SetInput(const Value: Integer);
    procedure PrintInitialInfo;
  public
    property Input: Integer read GetInput write SetInput;
    property Matrix: TMatrix read FMatrix write FMatrix;
  end;

implementation

{$R *.dfm}

procedure TMain.ActionCalculateExecute(Sender: TObject);
var
  Line, Column: Integer;
  Element, Elements: string;
begin
  Output.Clear;
  Matrix := TAlgorithms.DynPascal(Input);
  for Line := Low(Matrix) to High(Matrix) do
  begin
    Elements := string.Empty;
    for Column := Low(Matrix) to Pred(Input) - Line do
    begin
      Element := FormatElement(Matrix[Line][Column]);
      Elements := Elements + Element;
    end;
    Output.Lines.Insert(Line, Elements);
  end;
end;

procedure TMain.FormShow(Sender: TObject);
begin
  PrintInitialInfo;
  Input := 0;
  InputEdit.SetFocus;
end;

function TMain.FormatElement(const Element: Integer): string;
var
  Length: Integer;
  Mask: string;
begin
  Length := LengthOfHighestElement;
  Mask := '%.' + Length.ToString + 'd ';
  Result := Format(Mask, [Element]);
end;

function TMain.LengthOfHighestElement: Integer;
var
  Middle, Element: Integer;
begin
  Middle := Floor(Input / 2);
  Element := Matrix[Middle][Middle];
  Result := Length(Element.ToString);
end;

function TMain.GetInput: Integer;
begin
  Result := StrToIntDef(InputEdit.Text, 0);
end;

procedure TMain.SetInput(const Value: Integer);
begin
  InputEdit.Text := Value.ToString;
end;

procedure TMain.PrintInitialInfo;
begin
  Output.Clear;
  Output.Lines.Add('Disciplina: Projeto e Análise de Algoritmos');
  Output.Lines.Add('Professor: Rodrigo Calvo');
  Output.Lines.Add('Autor: Douglas Mezuraro - RA: 95676 - email: ra95676@uem.com.br');
  Output.Lines.Add('Autor: Ronnie Petterson Bueno - RA: 91938 - email: ra91938@uem.com.br');
  Output.Lines.Add('URL do repositório GIT: https://github.com/douglasmezuraro/paa-pascal-triangle');
end;

end.

