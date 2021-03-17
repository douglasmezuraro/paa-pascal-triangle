program Tests;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}

uses
  MidasLib,
  System.SysUtils,
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
{$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  Suite.PascalTriangle in 'src\Suite\Suite.PascalTriangle.pas',
  Impl.PascalTriangle in '..\Pascal\src\Impl\Impl.PascalTriangle.pas',
  Impl.Matrix in '..\Pascal\src\Impl\Impl.Matrix.pas';

procedure Run;
var
  LRunner: ITestRunner;
begin
  TDUnitX.CheckCommandLine;

  LRunner := TDUnitX.CreateRunner;
  LRunner.UseRTTI := True;
  LRunner.FailsOnNoAsserts := True;
  LRunner.AddLogger(TDUnitXConsoleLogger.Create(True));
  LRunner.AddLogger(TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile));

  if not LRunner.Execute.AllPassed then
  begin
    System.ExitCode := DUnitX.TestFramework.EXIT_ERRORS;
  end;

{$IFNDEF CI}
  if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
  begin
    System.Write('Done.. press <Enter> key to quit.');
    System.Readln;
  end;
{$ENDIF}
end;

begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  Exit;
{$ENDIF}
  try
    Run;
  {$WARN SYMBOL_PLATFORM OFF}
    ReportMemoryLeaksOnShutdown := DebugHook.ToBoolean;
  {$WARN SYMBOL_PLATFORM DEFAULT}
  except
    on E: Exception do
    begin
      System.Writeln(E.ClassName, ': ', E.Message);
    end;
  end;
end.

