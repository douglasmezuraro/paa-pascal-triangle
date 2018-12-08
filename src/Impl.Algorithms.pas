unit Impl.Algorithms;

interface

uses
  Impl.Types,
  System.Classes,
  System.SysUtils;

type
  TAlgorithms = class
  private
    class function Initialize(const N: Integer): TMatrix;
  public
    { without using dynamic-programming }
    class function Pascal(const N: Integer): TMatrix; overload;
      deprecated 'Use DynPascal';
    class function Pascal(const Line, Column: Integer): Integer; overload;
      deprecated 'Use DynPascal';
    { using dynamic-programming }
    class function DynPascal(const N: Integer): TMatrix; overload;
    class function DynPascal(const Line, Column: Integer;
      var Matrix: TMatrix): Integer; overload;
  end;

implementation

{ TAlgorithms }

class function TAlgorithms.DynPascal(const N: Integer): TMatrix;
begin
  Result := nil;
end;

class function TAlgorithms.DynPascal(const Line, Column: Integer;
  var Matrix: TMatrix): Integer;
begin
  Result := 0;
end;

class function TAlgorithms.Initialize(const N: Integer): TMatrix;
var
  Matrix: TMatrix;
  Line: Integer;
begin
  SetLength(Matrix, N);

  for Line := Low(Matrix) to High(Matrix) do
    SetLength(Matrix[Line], N);

  Result := Matrix;
end;

class function TAlgorithms.Pascal(const N: Integer): TMatrix;
var
  Matrix: TMatrix;
  Line, Column: Integer;
begin
  Matrix := Initialize(N);
  for Line := 0 to Pred(N) do
  begin
    for Column := 0 to Pred(N) do
    begin
      Matrix[Line][Column] := Pascal(Line, Column).ToString;
    end;
  end;
  Result := Matrix;
end;

class function TAlgorithms.Pascal(const Line, Column: Integer): Integer;
begin
  if (Line < 1) or (Column < 1) then
    Exit(1);

  Result := Pascal(Line, Pred(Column)) + Pascal(Pred(Line), Column);
end;

end.

