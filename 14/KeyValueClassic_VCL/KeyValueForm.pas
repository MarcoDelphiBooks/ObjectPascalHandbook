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
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    kv: TKeyValue;
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
  kv.Value := Sender;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  kv.Value := self; // the form
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ShowMessage ('[' + kv.Key + ',' + kv.Value.ClassName + ']');
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  kv := TKeyValue.Create;
end;

procedure TForm2.FormDestroy(Sender: TObject);
begin
  kv.Free;
end;

end.
