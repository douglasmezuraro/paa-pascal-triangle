program Pascal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Impl.Matrix in 'src\Impl\Impl.Matrix.pas',
  Impl.PascalTriangle in 'src\Impl\Impl.PascalTriangle.pas';

function GetSize: Integer;
var
  LValue: string;
begin
  Write('Enter the triangle pascal size: ');
  Readln(LValue);
  Result := System.SysUtils.StrToIntDef(LValue, 0);
end;

procedure Run;
var
  LPascalTriangle: TPascalTriangle;
begin
  LPascalTriangle := TPascalTriangle.Create(GetSize);
  try
    Write(LPascalTriangle.ToString);
  finally
    LPascalTriangle.Free;
  end;
end;

procedure Stop;
begin
  Write('Press <Enter> key to quit.');
  Readln;
end;

begin
  try
    try
      Run;
    finally
      Stop;
    end;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
    end;
  end;

{$WARN SYMBOL_PLATFORM OFF}
  ReportMemoryLeaksOnShutdown := DebugHook.ToBoolean;
{$WARN SYMBOL_PLATFORM DEFAULT}
end.

