program Pascal.Triangle;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in 'src\View.Main.pas' {Main},
  Impl.Matrix in 'src\Impl.Matrix.pas',
  Impl.PascalTriangle in 'src\Impl.PascalTriangle.pas',
  Impl.Helper in 'src\Impl.Helper.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook > 0;
  {$WARN SYMBOL_PLATFORM ON}
end.
