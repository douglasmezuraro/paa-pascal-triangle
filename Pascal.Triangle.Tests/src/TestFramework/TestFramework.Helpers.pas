unit TestFramework.Helpers;

interface

uses
  TestFramework, System.SysUtils;

type
  Matrix = TArray<TArray<UInt64>>;
  TCheckArrayTestCase = class Helper for TTestCase
  strict private
    function MatrixToString(const Value: Matrix): string;
    function EqualsMatrix(const A, B: Matrix): Boolean;
  public
    procedure CheckEquals(const Expected, Actual: Matrix; const Msg: string = string.Empty);
  end;

implementation

{ TCheckArrayTestCase }

procedure TCheckArrayTestCase.CheckEquals(const Expected, Actual: Matrix; const Msg: string);
var
  LMsg: string;
  Equals: Boolean;
begin
  Equals := EqualsMatrix(Expected, Actual);

  if (not Equals) and Msg.Trim.IsEmpty then
    LMsg := string.Format(sExpButWasFmt, [Msg, MatrixToString(Expected), MatrixToString(Actual)]);

  CheckTrue(Equals, LMsg);
end;

function TCheckArrayTestCase.EqualsMatrix(const A, B: Matrix): Boolean;
var
  Line, Column: Integer;
begin
  if Length(A) <> Length(B) then
    Exit(False);

  for Line := Low(A) to High(A) do
  begin
    for Column := Low(A) to High(A) do
    begin
      if A[Line][Column] <> B[Line][Column] then
        Exit(False);
    end;
  end;
  Result := True;
end;

function TCheckArrayTestCase.MatrixToString(const Value: Matrix): string;
var
  Line, Column: Integer;
begin
  if Length(Value) = UInt64.MinValue then
    Exit('[]');

  for Line := Low(Value) to High(Value) do
  begin
    Result := Result + '[';
    for Column := Low(Value) to High(Value) do
    begin
      if Result.EndsWith('[') then
        Result := Result + Value[Line][Column].ToString
      else
        Result := Result + ', ' + Value[Line][Column].ToString
    end;
    Result := Result + ']' + sLineBreak;
  end;
end;

end.
