unit NumbersEnumerator_MainForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnTest: TButton;
    procedure btnTestClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

type
  TNumbersRange = class
  public

  type
    TNumbersRangeEnum = class
    private
      nPos: Integer;
      fRange: TNumbersRange;
    public
      constructor Create (aRange: TNumbersRange);
      function MoveNext: Boolean;
      function GetCurrent: Integer;
      property Current: Integer read GetCurrent;
    end;

  private
    FnStart: Integer;
    FnEnd: Integer;

  public
    function GetEnumerator: TNumbersRangeEnum;
    procedure set_nEnd(const Value: Integer);
    procedure set_nStart(const Value: Integer);

    property nStart: Integer
      read FnStart write set_nStart;
    property nEnd: Integer
      read FnEnd write set_nEnd;
  end;

implementation

{$R *.fmx}




procedure TForm1.btnTestClick(Sender: TObject);
var
  aRange: TNumbersRange;
  I: Integer;
begin
  aRange := TNumbersRange.Create;
  aRange.nStart := 10;
  aRange.nEnd := 23;

  for I in aRange do
    Show (IntToStr (I));
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TNumbersRange }

function TNumbersRange.GetEnumerator: TNumbersRangeEnum;
begin
  Result := TNumbersRangeEnum.Create (self);
end;

constructor TNumbersRange.TNumbersRangeEnum.
  Create(aRange: TNumbersRange);
begin
  inherited Create;
  fRange := aRange;
  nPos := fRange.nStart - 1;
end;

function TNumbersRange.TNumbersRangeEnum.
  GetCurrent: Integer;
begin
  Result := nPos;
end;

function TNumbersRange.TNumbersRangeEnum.
  MoveNext: Boolean;
begin
  Inc (nPos);
  Result := nPos <= fRange.nEnd;
end;

procedure TNumbersRange.set_nEnd(const Value: Integer);
begin
  FnEnd := Value;
end;

procedure TNumbersRange.set_nStart(const Value: Integer);
begin
  FnStart := Value;
end;

end.
