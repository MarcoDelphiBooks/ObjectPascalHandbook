unit ExceptionForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    btnNoException: TButton;
    btnRaiseException: TButton;
    procedure btnNoExceptionClick(Sender: TObject);
    procedure btnRaiseExceptionClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

type
  TObjectWithList = class
  private
    FStringList: TStringList;
  public
    constructor Create (Value: Integer);
    destructor Destroy; override;
  end;


procedure TForm1.btnNoExceptionClick(Sender: TObject);
var
  Obj: TObjectWithList;
begin
  Obj := TObjectWithList.Create (10);
  try
    // do something
  finally
    Show ('Freeing object');
    Obj.Free;
  end;
end;

procedure TForm1.btnRaiseExceptionClick(Sender: TObject);
var
  Obj: TObjectWithList;
begin
  Obj := TObjectWithList.Create (-10);
  try
    // do something
  finally
    Show ('Freeing object');
    Obj.Free;
  end;

end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TObjectWithList }

constructor TObjectWithList.Create(Value: Integer);
begin
  if Value < 0 then
    raise Exception.Create('Negative value not allowed');

  FStringList := TStringList.Create;
  FStringList.Add('one');
end;

destructor TObjectWithList.Destroy;
begin
  // remove the if assinged test to see the error
  if Assigned (FStringList) then
  begin
    FStringList.Clear;
    FStringList.Free;
  end;
  inherited;
end;

end.
