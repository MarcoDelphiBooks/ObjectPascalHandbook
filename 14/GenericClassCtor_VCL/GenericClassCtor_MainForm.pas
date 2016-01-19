unit GenericClassCtor_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormGenericClassCtor = class(TForm)
    btnInt: TButton;
    Memo1: TMemo;
    btnString: TButton;
    btnSequence: TButton;
    procedure btnIntClick(Sender: TObject);
    procedure btnSequenceClick(Sender: TObject);
    procedure btnStringClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Log (const strMsg: string);
  end;

var
  FormGenericClassCtor: TFormGenericClassCtor;

implementation

{$R *.dfm}

uses GenericClassCtor_Classes;

type
  TGenDouble = TGenericWithClassCtor <Double>;

procedure TFormGenericClassCtor.btnIntClick(Sender: TObject);
var
  genInt: TGenericWithClassCtor <SmallInt>;
begin
  genInt := TGenericWithClassCtor <SmallInt>.Create;
  genInt.Data := 100;
  Log ('Size: ' + IntToStr (genInt.DataSize));
  genInt.Free;
end;

procedure TFormGenericClassCtor.btnSequenceClick(Sender: TObject);
begin
  Log (Trim(ListSequence.Text));
end;

procedure TFormGenericClassCtor.btnStringClick(Sender: TObject);
var
  genStr: TGenericWithClassCtor <string>;
begin
  genStr := TGenericWithClassCtor <string>.Create;
  genStr.Data := '100';
  Log ('Size: ' + IntToStr (genStr.DataSize));
  genStr.Free;
end;

procedure TFormGenericClassCtor.Log(const strMsg: string);
begin
  Memo1.Lines.Add(strMsg)
end;

end.
