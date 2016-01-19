unit ClassConstraint_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm30 = class(TForm)
    Memo1: TMemo;
    create: TButton;
    wrong: TButton;
    Button1: TButton;
    procedure createClick(Sender: TObject);
    procedure wrongClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

type
  TSampleClass <T: class> = class
  private
    data: T;
  public
    procedure One;
    function ReadT: T;
    procedure SetT (t: T);
  end;

{ TSampleClass<T> }

procedure TSampleClass<T>.One;
begin
  if Assigned (data) then
  begin
    Form30.Log('ClassName: ' + data.ClassName);
    Form30.Log('Size: ' + IntToStr (data.InstanceSize));
    Form30.Log('ToString: ' + data.ToString);
  end;
end;

function TSampleClass<T>.ReadT: T;
begin
  Result := data;
end;

procedure TSampleClass<T>.SetT(t: T);
begin
  data := t;
end;

{ TForm30 }

type
  TMyButton = class (TButton)
  public
    function ToString: string; override;
  end;

procedure TForm30.Button1Click(Sender: TObject);
var
  sample1: TSampleClass<TButton>;
  sample2: TSampleClass<TMyButton>;
  mb: TMybutton;
begin
  mb := TMyButton.Create(self);
  mb.Caption := 'hello';

  sample1 := TSampleClass<TButton>.Create;
  try
    sample1.SetT (mb);
    sample1.One;
  finally
    sample1.Free;
  end;

  sample2 := TSampleClass<TMyButton>.Create;
  try
    sample2.SetT (mb);
    sample2.One;
  finally
    sample2.Free;
  end;

end;

procedure TForm30.createClick(Sender: TObject);
var
  sample1: TSampleClass<TButton>;
  sample2: TSampleClass<TStrings>;
begin
  sample1 := TSampleClass<TButton>.Create;
  try
    sample1.SetT (Sender as TButton);
    sample1.One;
  finally
    sample1.Free;
  end;

  sample2 := TSampleClass<TStrings>.Create;
  try
    sample2.SetT (Memo1.Lines);
    sample2.One;
  finally
    sample2.Free;
  end;
end;

procedure TForm30.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

procedure TForm30.wrongClick(Sender: TObject);
//var
//  sample3: TSampleClass<Integer>;
//  // E2511 Type parameter 'T' must be a class type
begin
  // nothing do to
end;

{ TMyButton }

function TMyButton.ToString: string;
begin
  Result := Caption;
end;

end.
