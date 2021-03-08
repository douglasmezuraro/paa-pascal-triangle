unit Suite.PascalTriangle;

interface

uses
  DUnitX.TestFramework, System.Generics.Collections, Impl.PascalTriangle;

type
  [TestFixture]
  TPascalTriangleTest = class sealed
  strict private
    FToArray: TDictionary<Integer, TArray<TArray<Integer>>>;
    FToString: TDictionary<Integer, string>;
  public
    [Setup]
    procedure Setup;

    [TearDown]
    procedure TearDown;

    [Test]
    [TestCase('When size is 01', '01')]
    [TestCase('When size is 02', '02')]
    [TestCase('When size is 04', '04')]
    [TestCase('When size is 08', '08')]
    [TestCase('When size is 16', '16')]
    procedure TestToArray(const ASize: Integer);

    [Test]
    [TestCase('When size is 01', '01')]
    [TestCase('When size is 02', '02')]
    [TestCase('When size is 04', '04')]
    [TestCase('When size is 08', '08')]
    [TestCase('When size is 16', '16')]
    procedure TestToString(const ASize: Integer);
  end;

implementation

procedure TPascalTriangleTest.Setup;
begin
  FToArray := TDictionary<Integer, TArray<TArray<Integer>>>.Create;
  FToString := TDictionary<Integer, string>.Create;

  FToString.Add(1,
    '+-+' + sLineBreak +
    '|1|' + sLineBreak +
    '+-+' + sLineBreak
  );
  FToString.Add(2,
    '+-+-+' + sLineBreak +
    '|1|1|' + sLineBreak +
    '+-+-+' + sLineBreak +
    '|1|'   + sLineBreak +
    '+-+'   + sLineBreak
  );
  FToString.Add(4,
    '+-+-+-+-+' + sLineBreak +
    '|1|1|1|1|' + sLineBreak +
    '+-+-+-+-+' + sLineBreak +
    '|1|2|3|'   + sLineBreak +
    '+-+-+-+'   + sLineBreak +
    '|1|3|'     + sLineBreak +
    '+-+-+'     + sLineBreak +
    '|1|'       + sLineBreak +
    '+-+'       + sLineBreak
  );
  FToString.Add(8,
    '+--+--+--+--+--+--+--+--+' + sLineBreak +
    '| 1| 1| 1| 1| 1| 1| 1| 1|' + sLineBreak +
    '+--+--+--+--+--+--+--+--+' + sLineBreak +
    '| 1| 2| 3| 4| 5| 6| 7|'    + sLineBreak +
    '+--+--+--+--+--+--+--+'    + sLineBreak +
    '| 1| 3| 6|10|15|21|'       + sLineBreak +
    '+--+--+--+--+--+--+'       + sLineBreak +
    '| 1| 4|10|20|35|'          + sLineBreak +
    '+--+--+--+--+--+'          + sLineBreak +
    '| 1| 5|15|35|'             + sLineBreak +
    '+--+--+--+--+'             + sLineBreak +
    '| 1| 6|21|'                + sLineBreak +
    '+--+--+--+'                + sLineBreak +
    '| 1| 7|'                   + sLineBreak +
    '+--+--+'                   + sLineBreak +
    '| 1|'                      + sLineBreak +
    '+--+'                      + sLineBreak
  );
  FToString.Add(16,
    '+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+' + sLineBreak +
    '|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|   1|' + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+' + sLineBreak +
    '|   1|   2|   3|   4|   5|   6|   7|   8|   9|  10|  11|  12|  13|  14|  15|'      + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+----+----+----+----+'      + sLineBreak +
    '|   1|   3|   6|  10|  15|  21|  28|  36|  45|  55|  66|  78|  91| 105|'           + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+----+----+----+'           + sLineBreak +
    '|   1|   4|  10|  20|  35|  56|  84| 120| 165| 220| 286| 364| 455|'                + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+----+----+'                + sLineBreak +
    '|   1|   5|  15|  35|  70| 126| 210| 330| 495| 715|1001|1365|'                     + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+----+'                     + sLineBreak +
    '|   1|   6|  21|  56| 126| 252| 462| 792|1287|2002|3003|'                          + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+----+'                          + sLineBreak +
    '|   1|   7|  28|  84| 210| 462| 924|1716|3003|5005|'                               + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+----+'                               + sLineBreak +
    '|   1|   8|  36| 120| 330| 792|1716|3432|6435|'                                    + sLineBreak +
    '+----+----+----+----+----+----+----+----+----+'                                    + sLineBreak +
    '|   1|   9|  45| 165| 495|1287|3003|6435|'                                         + sLineBreak +
    '+----+----+----+----+----+----+----+----+'                                         + sLineBreak +
    '|   1|  10|  55| 220| 715|2002|5005|'                                              + sLineBreak +
    '+----+----+----+----+----+----+----+'                                              + sLineBreak +
    '|   1|  11|  66| 286|1001|3003|'                                                   + sLineBreak +
    '+----+----+----+----+----+----+'                                                   + sLineBreak +
    '|   1|  12|  78| 364|1365|'                                                        + sLineBreak +
    '+----+----+----+----+----+'                                                        + sLineBreak +
    '|   1|  13|  91| 455|'                                                             + sLineBreak +
    '+----+----+----+----+'                                                             + sLineBreak +
    '|   1|  14| 105|'                                                                  + sLineBreak +
    '+----+----+----+'                                                                  + sLineBreak +
    '|   1|  15|'                                                                       + sLineBreak +
    '+----+----+'                                                                       + sLineBreak +
    '|   1|'                                                                            + sLineBreak +
    '+----+'                                                                            + sLineBreak
  );
  FToArray.Add(1, [
    [1]
  ]);
  FToArray.Add(2, [
    [1, 1],
    [1, 0]
  ]);
  FToArray.Add(4, [
    [1, 1, 1, 1],
    [1, 2, 3, 0],
    [1, 3, 0, 0],
    [1, 0, 0, 0]
  ]);
  FToArray.Add(8, [
    [01, 01, 01, 01, 01, 01, 01, 01],
    [01, 02, 03, 04, 05, 06, 07, 00],
    [01, 03, 06, 10, 15, 21, 00, 00],
    [01, 04, 10, 20, 35, 00, 00, 00],
    [01, 05, 15, 35, 00, 00, 00, 00],
    [01, 06, 21, 00, 00, 00, 00, 00],
    [01, 07, 00, 00, 00, 00, 00, 00],
    [01, 00, 00, 00, 00, 00, 00, 00]
  ]);
  FToArray.Add(16, [
    [0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001, 0001],
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
    [0001, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000, 0000]
  ]);
end;

procedure TPascalTriangleTest.TearDown;
begin
  FToString.Free;
  FToArray.Free;
end;

procedure TPascalTriangleTest.TestToArray(const ASize: Integer);
var
  LPascalTriangle: TPascalTriangle;
  LExpected, LActual: TArray<TArray<Integer>>;
  LRow, LColumn: Integer;
begin
  LPascalTriangle := TPascalTriangle.Create(ASize);
  try
    LExpected := FToArray.Items[ASize];
    LActual := LPascalTriangle.ToArray;

    for LRow := 0 to ASize - 1 do
    begin
      for LColumn := 0 to ASize - 1 do
      begin
        Assert.AreEqual(LExpected[LRow][LColumn], LActual[LRow][LColumn]);
      end;
    end;
  finally
    LPascalTriangle.Free;
  end;
end;

procedure TPascalTriangleTest.TestToString(const ASize: Integer);
var
  LPascalTriangle: TPascalTriangle;
  LExpected, LActual: string;
begin
  LPascalTriangle := TPascalTriangle.Create(ASize);
  try
    LExpected := FToString.Items[ASize];
    LActual := LPascalTriangle.ToString;

    Assert.AreEqual(LExpected, LActual);
  finally
    LPascalTriangle.Free;
  end;
end;

initialization
  TDUnitX.RegisterTestFixture(TPascalTriangleTest);

end.

