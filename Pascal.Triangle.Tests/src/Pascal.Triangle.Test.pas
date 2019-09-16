unit Pascal.Triangle.Test;

interface

uses
  TestFramework, TestFramework.Helpers, Impl.Matrix, System.SysUtils,
  Impl.PascalTriangle;

type
  PascalTriangleTest = class(TTestCase)
  private
    type Matrix = TArray<TArray<UInt64>>;
  published
    procedure TestPascalTriangleWhenSizeIsZero;
    procedure TestPascalTriangleWhenSizeIsOne;
    procedure TestPascalTriangleWhenSizeIsTwo;
    procedure TestPascalTriangleWhenSizeIsFour;
    procedure TestPascalTriangleWhenSizeIsEight;
    procedure TestPascalTriangleWHenSizeIsSixteen;
  end;

implementation

{ PascalTriangleTest }

procedure PascalTriangleTest.TestPascalTriangleWhenSizeIsZero;
const
  LExpected: Matrix = [];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(0).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

procedure PascalTriangleTest.TestPascalTriangleWhenSizeIsOne;
const
  LExpected: Matrix = [[1]];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(1).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

procedure PascalTriangleTest.TestPascalTriangleWhenSizeIsTwo;
const
  LExpected: Matrix = [[1, 1],
                       [1, 0]];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(2).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

procedure PascalTriangleTest.TestPascalTriangleWhenSizeIsFour;
const
  LExpected: Matrix = [[1, 1, 1, 1],
                       [1, 2, 3, 0],
                       [1, 3, 0, 0],
                       [1, 0, 0, 0]];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(4).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

procedure PascalTriangleTest.TestPascalTriangleWhenSizeIsEight;
const
  LExpected: Matrix = [[01, 01, 01, 01, 01, 01, 01, 01],
                       [01, 02, 03, 04, 05, 06, 07, 00],
                       [01, 03, 06, 10, 15, 21, 00, 00],
                       [01, 04, 10, 20, 35, 00, 00, 00],
                       [01, 05, 15, 35, 00, 00, 00, 00],
                       [01, 06, 21, 00, 00, 00, 00, 00],
                       [01, 07, 00, 00, 00, 00, 00, 00],
                       [01, 00, 00, 00, 00, 00, 00, 00]];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(8).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

procedure PascalTriangleTest.TestPascalTriangleWHenSizeIsSixteen;
const
  LExpected: Matrix = [[0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001],
                       [0001, 0002, 0003, 0004, 0005, 0006, 0007, 0008, 0009, 0010, 0011, 0012, 0013, 0014, 0015, 0000],
                       [0001, 0003, 0006, 0010, 0015, 0021, 0028, 0036, 0045, 0055, 0066, 0078, 0091, 0105, 0000, 0000],
                       [0001, 0004, 0010, 0020, 0035, 0056, 0084, 0120, 0165, 0220, 0286, 0364, 0455, 0000, 0000, 0000],
                       [0001, 0005, 0015, 0035, 0070, 0126, 0210, 0330, 0495, 0715, 1001, 1365, 0000, 0000, 0000, 0000],
                       [0001, 0006, 0021, 0056, 0126, 0252, 0462, 0792, 1287, 2002, 3003, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0007, 0028, 0084, 0210, 0462, 0924, 1716, 3003, 5005, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0008, 0036, 0120, 0330, 0792, 1716, 3432, 6435, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0009, 0045, 0165, 0495, 1287, 3003, 6435, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0010, 0055, 0220, 0715, 2002, 5005, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0011, 0066, 0286, 1001, 3003, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0012, 0078, 0364, 1365, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0013, 0091, 0455, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0014, 0105, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0015, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000],
                       [0001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000]];
var
  LMatrix: Matrix;
begin
  LMatrix := TPascalTriangle.Pascal(16).AsMatrix;
  CheckEquals(LExpected, LMatrix);
end;

initialization
  RegisterTest(PascalTriangleTest.Suite);

end.

