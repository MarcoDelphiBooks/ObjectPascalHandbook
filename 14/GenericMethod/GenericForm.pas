unit GenericForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses
  TypInfo;

type
  TGenericFunction = class
  public
    function WithParam <T> (t1: T): string;
  end;

procedure TForm1.Button1Click(Sender: TObject);
var
  gf: TGenericFunction;
begin
  gf := TGenericFunction.Create;
  try
    Show (gf.WithParam<string>('foo'));
    Show (gf.WithParam<Integer> (122));
    Show (gf.WithParam('hello'));
    Show (gf.WithParam (122));
    Show (gf.WithParam(Button1));
    Show (gf.WithParam<TObject>(Button1));
  finally
    gf.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  gf: TGenericFunction;
begin
  gf := TGenericFunction.Create;
  try
    // these 3 are all wrong
    // Show (gf.WithParam<Integer>('foo'));
    // Show (gf.WithParam<string> (122));
    // Show (gf.WithParam<TButton>(self));
  finally
    gf.Free;
  end;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ TGenericFunction }

function TGenericFunction.WithParam<T>(t1: T): string;
begin
  Result := GetTypeName (TypeInfo (T));
  // if IsManagedType (T) then
  //   Result := Result + ' managed';
end;

end.
