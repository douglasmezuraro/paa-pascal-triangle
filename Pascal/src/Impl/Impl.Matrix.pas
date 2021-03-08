unit Impl.Matrix;

interface

uses
  System.Math, System.StrUtils, System.SysUtils;

type
  TMatrix = record
  strict private
    FMatrix: TArray<TArray<Integer>>;
    FDefaultValue: Integer;
    FRows: Integer;
    FColumns: Integer;
  private
    function GetValue(const ARow, AColumn: Integer): Integer;
    procedure SetValue(const ARow, AColumn: Integer; const AValue: Integer);
  public
    constructor Create(const ARows, AColumns: Integer; const ADefaultValue: Integer = 0);
    function ToArray: TArray<TArray<Integer>>;
    function ToString(const AColumnLength: Integer): string;
    property Rows: Integer read FRows write FRows;
    property Columns: Integer read FColumns write FColumns;
    property Value[const ARow, AColumn: Integer]: Integer read GetValue write SetValue;
  end;

implementation

constructor TMatrix.Create(const ARows, AColumns, ADefaultValue: Integer);
var
  LRow, LColumn: Integer;
begin
  if ARows < 1 then
  begin
    raise EArgumentException.Create('The matrix rows must be positive.');
  end;

  if AColumns < 1 then
  begin
    raise EArgumentException.Create('The matrix columns must be positive.');
  end;

  SetLength(FMatrix, ARows, AColumns);
  FRows := ARows;
  FColumns := AColumns;
  FDefaultValue := ADefaultValue;

  for LRow := 0 to ARows - 1 do
  begin
    for LColumn := 0 to AColumns - 1 do
    begin
      Value[LRow, LColumn] := ADefaultValue;
    end;
  end;
end;

function TMatrix.GetValue(const ARow, AColumn: Integer): Integer;
begin
  Result := FMatrix[ARow][AColumn];
end;

procedure TMatrix.SetValue(const ARow, AColumn, AValue: Integer);
begin
  FMatrix[ARow][AColumn] := AValue;
end;

function TMatrix.ToArray: TArray<TArray<Integer>>;
begin
  Result := FMatrix;
end;

function TMatrix.ToString(const AColumnLength: Integer): string;
var
  LStringBuilder: TStringBuilder;
  LRow, LColumn: Integer;
  LChar, LValueRow, LSeparatorRow: string;
begin
  LStringBuilder := TStringBuilder.Create;
  try
    for LRow := 0 to FRows - 1 do
    begin
      LValueRow := string.Empty;
      LSeparatorRow := string.Empty;

      for LColumn := 0 to FColumns - 1 do
      begin
        if Value[LRow, LColumn] = FDefaultValue then
        begin
          Continue;
        end;

        LValueRow := LValueRow + '|' + Value[LRow, LColumn].ToString.PadLeft(AColumnLength);
      end;

      LValueRow := LValueRow + '|';
      for LChar in LValueRow do
      begin
        LSeparatorRow := LSeparatorRow + IfThen(LChar.Equals('|'), '+', '-');
      end;

      if LRow = 0 then
      begin
        LStringBuilder.AppendLine(LSeparatorRow);
      end;

      LStringBuilder.AppendLine(LValueRow).AppendLine(LSeparatorRow);
    end;

    Result := LStringBuilder.ToString;
  finally
    LStringBuilder.Free;
  end;
end;

end.

