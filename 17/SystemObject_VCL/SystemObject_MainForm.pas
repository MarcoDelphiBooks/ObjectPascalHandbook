unit SystemObject_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAnyObject = class
  private
    Value: Integer;
    name: string;
  public
    constructor Create (aName: string; aValue: Integer);
    function Equals(obj: TObject): Boolean; override;
    function ToString: string; override;
  end;

  TFormSystemObject = class(TForm)
    Memo1: TMemo;
    btnCompare: TButton;
    btnTest: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    procedure btnCompareClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTestClick(Sender: TObject);
  private
    ao1, ao2, ao3, ao4: TAnyObject;
    procedure Log (const strMsg: string);
  public
    { Public declarations }
  end;

var
  FormSystemObject: TFormSystemObject;

implementation

uses
  TypInfo;

{$R *.dfm}

procedure TFormSystemObject.btnCompareClick(Sender: TObject);
begin
  Log ('Comparing ' + ComboBox1.Items [ComboBox1.ItemIndex] +
    ' and ' + ComboBox2.Items [ComboBox2.ItemIndex]);
  Log ('Equals: ' +
    BoolToStr (ComboBox1.Items.Objects [ComboBox1.ItemIndex].Equals (
      ComboBox2.Items.Objects [ComboBox2.ItemIndex]), True));
  Log ('Reference = ' +
    BoolToStr (ComboBox1.Items.Objects [ComboBox1.ItemIndex] =
      ComboBox2.Items.Objects [ComboBox2.ItemIndex], True));
end;

{ TAnyObject }

constructor TAnyObject.Create(aName: string; aValue: Integer);
begin
  inherited Create;
  name := aName;
  Value := aValue;
end;

function TAnyObject.Equals(obj: TObject): Boolean;
begin
  Result := (obj.ClassType = self.ClassType) and
    ((obj as TAnyObject).Value = self.Value)
end;

function TAnyObject.ToString: string;
begin
  Result := Name;
end;

procedure TFormSystemObject.btnTestClick(Sender: TObject);
var
  btn2: TButton;
begin
  btn2 := btnTest;
  Log ('Equals: ' +
    BoolToStr (btnTest.Equals (btn2), True));
  Log ('Reference = ' +
    BoolToStr (btnTest = btn2, True));
  Log ('GetHashCode: ' +
    IntToStr (btnTest.GetHashCode));
  Log ('ToString: ' + btnTest.ToString);
end;

procedure TFormSystemObject.FormCreate(Sender: TObject);
begin
  ao1 := TAnyObject.Create ('ao1', 10);
  ao2 := TAnyObject.Create ('ao2 or ao3', 20);
  ao3 := ao2;
  ao4 := TAnyObject.Create ('ao4', 20);

  ComboBox1.Items.AddObject (ao1.ToString, ao1);
  ComboBox1.Items.AddObject (ao2.ToString, ao2);
  ComboBox1.Items.AddObject (ao3.ToString, ao3);
  ComboBox1.Items.AddObject (ao4.ToString, ao4);

  ComboBox2.Items.AddObject (ao1.ToString, ao1);
  ComboBox2.Items.AddObject (ao2.ToString, ao2);
  ComboBox2.Items.AddObject (ao3.ToString, ao3);
  ComboBox2.Items.AddObject (ao4.ToString, ao4);
end;


procedure TFormSystemObject.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
