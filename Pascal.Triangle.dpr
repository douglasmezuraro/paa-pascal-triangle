// Autor: Douglas Mezuraro - RA: 95676 - email: ra95676@uem.com.br
// Autor: Ronnie Petterson Bueno - RA: 91938 - email: ra91938@uem.com.br
// Repositório: https://github.com/douglasmezuraro/paa-pascal-triangle/

program Pascal.Triangle;

uses
  Vcl.Forms,
  Form.Main in 'src\Form.Main.pas' {Main},
  Impl.PascalTriangle in 'src\Impl.PascalTriangle.pas',
  Impl.Matrix in 'src\Impl.Matrix.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
  ReportMemoryLeaksOnShutdown := True;
end.
