program Pascal.Triangle;

uses
  Vcl.Forms,
  Forms.Main in 'Forms.Main.pas' {Main},
  Impl.Algorithms in 'Impl.Algorithms.pas',
  Impl.Types in 'Impl.Types.pas';

{$R *.res}

var
  Main: TMain;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMain, Main);
  Application.Run;
end.
