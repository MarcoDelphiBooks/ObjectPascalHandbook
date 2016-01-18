unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  Unit1;

type
  TForm2 = class(TForm1)
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
begin
  // inherited;
  Hide;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  inherited;
  ShowMessage ('Hello from Form2');
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  inherited;
  Button3.Text := Button3.Text + '*';
end;

end.
