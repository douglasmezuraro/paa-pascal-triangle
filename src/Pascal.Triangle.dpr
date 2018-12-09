program Pascal.Triangle;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {Main},
  Impl.PascalTriangle in 'Impl.PascalTriangle.pas',
  Impl.Matrix in 'Impl.Matrix.pas';

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
