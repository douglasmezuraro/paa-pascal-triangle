program Pascal;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Impl.Matrix in 'src\Impl\Impl.Matrix.pas',
  Impl.PascalTriangle in 'src\Impl\Impl.PascalTriangle.pas';

procedure Foo;
var
  LPascalTriangle: TPascalTriangle;
begin
  LPascalTriangle := TPascalTriangle.Create(10);
  try
    Write(LPascalTriangle.ToString);
  finally
    LPascalTriangle.Free;
  end;
end;

begin
  try
    Foo;
    Readln;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
    end;
  end;
end.
