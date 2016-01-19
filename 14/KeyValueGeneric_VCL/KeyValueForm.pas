unit KeyValueForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, KeyValueCode;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    kv: TKeyValue<TButton>;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  kv.Key := 'mykey';
  kv.Value := Sender as TButton;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  kv.Value := Sender as TButton; // was "self"
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  // ShowMessage ('[' + kv.Key + ',' + kv.Value.ClassName + ']');
  ShowMessage ('[' + kv.Key + ',' + kv.Value.Name + ']');
end;

procedure TForm2.Button4Click(Sender: TObject);
var
  kvo: TKeyValue<TObject>;
begin
  kvo := TKeyValue<TObject>.Create;
  try
    kvo.Key := 'object';
    kvo.Value := Sender;
    kvo.Value := self;
    ShowMessage ('[' + kvo.Key + ',' +
      kvo.Value.ClassName + ']');
  finally
    kvo.Free;
  end;
end;

procedure TForm2.Button5Click(Sender: TObject);
var
  kvi: TKeyValue<Integer>;
begin
  kvi := TKeyValue<Integer>.Create;
  try
    kvi.Key := 'object';
    kvi.Value := 100;
    kvi.Value := Left;
    ShowMessage ('[' + kvi.Key + ',' +
      IntToStr (kvi.Value) + ']');
  finally
    kvi.Free;
  end;
end;

procedure TForm2.Button6Click(Sender: TObject);
var
  kvo: TKeyValue<TComponent>;
begin
  kvo := TKeyValue<TComponent>.Create;
  try
    kvo.Key := 'object';
    kvo.Value := Sender as TComponent;
    kvo.Value := self;
    ShowMessage ('[' + kvo.Key + ',' +
      kvo.Value.Name + ']');
  finally
    kvo.Free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  kv := TKeyValue<TButton>.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  kv.Free;
end;

end.
