unit ShowMemoryForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Objects;

type
  TForm1 = class(TForm)
    Button1: TButton;
    AniIndicator1: TAniIndicator;
    Image2: TImage;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  System.UIConsts, FMX.Utils;

procedure TForm1.Button1Click(Sender: TObject);
var
  AMemoryMap: TMemoryMap;
  cs: TChunkStatus;
  I: Integer;
  col: TAlphaColor;
  Bitmap1: TBitmap;
  bd1: TBitmapData;
  p1: PAlphaColorArray;
  memStream: TMemoryStream;
begin
  AniIndicator1.Enabled := True;
  AniIndicator1.Visible := True;

  Bitmap1:= TBitmap.Create(256, 256);
  try
    Bitmap1.Map(TMapAccess.Write, bd1);
    col := claBlack; // only to avoid warning
    GetMemoryMap (AMemoryMap);
    for I := low(aMemoryMap) to high(aMemoryMap) do
    begin
      cs := AMemoryMap[I];
      case cs of
        csUnallocated: col := claWhite;
        csAllocated: col := claBlue;
        csReserved: col := claRed;
        csSysAllocated: col := claBlack;
        csSysReserved: col := claYellow;
      end;

      p1 := PAlphaColorArray(bd1.GetScanline(I mod 256));
      p1[I div 256] := col;
    end;
    Bitmap1.Unmap(bd1);
    Image2.Bitmap := Bitmap1;
  finally
    AniIndicator1.Enabled := False;
    AniIndicator1.Visible := False;
    Bitmap1.Free;
  end;

end;

end.
