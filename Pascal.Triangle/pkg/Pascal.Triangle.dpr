program Pascal.Triangle;

uses
  System.StartUpCopy,
  FMX.Forms,
  View.Main in '..\src\View\View.Main.pas' {Main},
  Impl.PascalTriangle in '..\src\Impl\Impl.PascalTriangle.pas',
  Impl.Matrix in '..\src\Impl\Impl.Matrix.pas',
  Impl.Helper in '..\src\Impl\Impl.Helper.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.CreateForm(TMain, Main);
  Application.Run;

  {$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := WordBool(DebugHook);
  {$WARN SYMBOL_PLATFORM ON}
end.

