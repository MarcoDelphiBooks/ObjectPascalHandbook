unit IdentifiersTestForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs;

type
  TForm1 = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  // classic identifiers
  MyValue: Integer;
  Value1: Integer;
  My_Value: Integer;
  _Value: Integer;
  Val123: Integer;
  _123: Integer;
  Cantu: Integer;

  // valid unicode identifiers
  Cantù: Integer;
  结: Integer;
  画像: Integer;
  ☼: Integer;
  ⒈5: Integer;

  // invalid identifiers
  // 123: Integer;
  // 1Value: Integer;
  // My Value: Integer;
  // My-Value: Integer;
  // My%Value: Integer;


implementation

{$R *.fmx}

end.
