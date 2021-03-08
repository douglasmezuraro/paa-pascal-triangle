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
  LResults: IRunResults;
  LLogger: ITestLogger;
  LUnitLogger: ITestLogger;
begin
  TDUnitX.CheckCommandLine;
  LRunner := TDUnitX.CreateRunner;
  LRunner.UseRTTI := True;
  LLogger := TDUnitXConsoleLogger.Create(true);
  LRunner.AddLogger(LLogger);
  LUnitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
  LRunner.AddLogger(LUnitLogger);
  LRunner.FailsOnNoAsserts := True;

  LResults := LRunner.Execute;
  if not LResults.AllPassed then
  begin
    System.ExitCode := EXIT_ERRORS;
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

