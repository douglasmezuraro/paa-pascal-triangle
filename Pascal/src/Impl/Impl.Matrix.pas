unit Impl.Matrix;

interface

uses
  System.StrUtils, System.SysUtils;

type
  TMatrix = record
  strict private
    FSize: Integer;
    FMatrix: TArray<TArray<Integer>>;
  private
    function GetLow: Integer;
    function GetHigh: Integer;
    function GetValue(const ARow, AColumn: Integer): Integer;
    procedure SetValue(const ARow, AColumn: Integer; const AValue: Integer);
  public
    constructor Create(const ASize: Integer; const AValue: Integer);
    function ToString(const AColumnLength: Integer): string;
    property Value[const ARow, AColumn: Integer]: Integer read GetValue write SetValue;
    property Low: Integer read GetLow;
    property High: Integer read GetHigh;
    property Size: Integer read FSize;
  end;

implementation

constructor TMatrix.Create(const ASize: Integer; const AValue: Integer);
var
  LRow, LColumn: Integer;
begin
  SetLength(FMatrix, ASize, ASize);

  if FSize = 0 then
  begin
    Exit;
  end;

  FSize := ASize;
  for LRow := Low to High do
  begin
    for LColumn := Low to High do
    begin
      Value[LRow, LColumn] := AValue;
    end;
  end;
end;

function TMatrix.GetHigh: Integer;
begin
  Result := System.High(FMatrix);
end;

function TMatrix.GetLow: Integer;
begin
  Result := System.Low(FMatrix);
end;

function TMatrix.GetValue(const ARow, AColumn: Integer): Integer;
begin
  Result := FMatrix[ARow][AColumn];
end;

procedure TMatrix.SetValue(const ARow, AColumn: Integer; const AValue: Integer);
begin
  FMatrix[ARow][AColumn] := AValue;
end;

function TMatrix.ToString(const AColumnLength: Integer): string;
var
  LStringBuilder: TStringBuilder;
  LRow, LColumn: Integer;
  LChar, LValue, LSeparator: string;
begin
  LStringBuilder := TStringBuilder.Create;
  try
    for LRow := Low to High do
    begin
      LValue := string.Empty;
      LSeparator := string.Empty;

      for LColumn := Low to High do
      begin
        if Value[LRow, LColumn] > 0 then
        begin
          LValue := LValue + '|' + Value[LRow, LColumn].ToString.PadLeft(AColumnLength);
        end;
      end;

      LValue := LValue + '|';
      for LChar in LValue do
      begin
        LSeparator := LSeparator + IfThen(LChar.Equals('|'), '+', '-');
      end;

      if LRow = 0 then
      begin
        LStringBuilder.AppendLine(LSeparator);
      end;

      LStringBuilder.AppendLine(LValue).AppendLine(LSeparator);
    end;

    Result := LStringBuilder.ToString;
  finally
    LStringBuilder.Free;
  end;
end;

end.

