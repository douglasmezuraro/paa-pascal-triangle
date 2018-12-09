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
    procedure PrintMatrix;
  public
    property Input: Integer read GetInput write SetInput;
    property Matrix: TMatrix read FMatrix write FMatrix;
  end;

implementation

{$R *.dfm}

procedure TMain.ActionCalculateExecute(Sender: TObject);
begin
  Output.Clear;
  Matrix := TPascalTriangle.Pascal(Input);
  PrintMatrix;
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
  Mask := '%.' + Length.ToString + 'd';
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

procedure TMain.PrintMatrix;
const
  Separator = ' ';
var
  Row, Column: Integer;
  Element, Line: string;
begin
  for Row := Low(Matrix) to High(Matrix) do
  begin
    Line := string.Empty;
    for Column := Low(Matrix) to Pred(Input) - Row do
    begin
      Element := FormatElement(Matrix[Row][Column]);
      Line := Line + Element + Separator;
    end;
    Output.Lines.Add(Line);
  end;
end;

end.

