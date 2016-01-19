unit RttiForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo, FMX.ListBox, FMX.ListView.Types, FMX.ListView;

type
  TForm1 = class(TForm)
    btnReadValues: TButton;
    btnInvoke: TButton;
    Memo1: TMemo;
    procedure btnReadValuesClick(Sender: TObject);
    procedure btnInvokeClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (Message: string);
  end;

var
  Form1: TForm1;


implementation

{$R *.fmx}

uses
  System.Rtti;

procedure TForm1.btnInvokeClick(Sender: TObject);
var
  context: TRttiContext;
  aType: TRttiType;
  aMethod: TRttiMethod;
  theValues: array of TValue;
  aValue: TValue;
begin
  aType := context.GetType(TButton);
  aMethod := aType.GetMethod('ToString');
  theValues := [];
  aValue := aMethod.Invoke(Sender, theValues);
  Show(aValue.AsString);

  aType := context.GetType(TForm1);
  aMethod := aType.GetMethod('Show');
  SetLength (theValues, 1);
  theValues[0] := aValue;
  aMethod.Invoke(self, theValues);
end;

procedure TForm1.btnReadValuesClick(Sender: TObject);
var
  context: TRttiContext;
  aType: TRttiType;
  aProperty: TRttiProperty;
  aValue: TValue;
  aField: TRttiField;
begin
  aType := context.GetType(TButton);
  aProperty := aType.GetProperty('Text');
  aValue := aProperty.GetValue(Sender);
  Show (aValue.AsString);

  aField := aType.GetField('FDesignInfo');
  aValue := aField.GetValue(Sender);
  Show (aValue.AsInteger.ToString);
end;

procedure TForm1.Show(Message: string);
begin
  Memo1.Lines.Add(Message);
end;

end.
