unit AnimalsForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, AnimalsClasses;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Button2: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Panel1: TPanel;
    procedure Button2Click(Sender: TObject);
    procedure RadioButton1Change(Sender: TObject);
    procedure RadioButton2Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    MyAnimal: TAnimal;
  public
    procedure Show (const msg: string);
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}


procedure TForm1.Button2Click(Sender: TObject);
begin
  Show (MyAnimal.GetKind);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MyAnimal := TAnimal.Create;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  MyAnimal.Free;
end;

procedure TForm1.RadioButton1Change(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TAnimal.Create;
end;

procedure TForm1.RadioButton2Change(Sender: TObject);
begin
  MyAnimal.Free;
  MyAnimal := TDog.Create;
end;

procedure TForm1.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

end.
