program Pascal.Triangle.Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  Pascal.Triangle.Test in '..\src\Pascal.Triangle.Test.pas',
  TestFramework.Helpers in '..\src\TestFramework\TestFramework.Helpers.pas',
  Impl.PascalTriangle in '..\..\Pascal.Triangle\src\Impl\Impl.PascalTriangle.pas',
  Impl.Matrix in '..\..\Pascal.Triangle\src\Impl\Impl.Matrix.pas';

{$R *.RES}

begin
  DUnitTestRunner.RunRegisteredTests;
end.

