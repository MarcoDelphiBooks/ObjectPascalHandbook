unit ListDictionary_MainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Generics.Collections, Vcl.StdCtrls;

type
  TMyObject = class
  private
    FValue: Integer;
    procedure SetValue(const Value: Integer);
  public
    property Value: Integer read FValue write SetValue;
  end;

  TFormLists = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Memo2: TMemo;
    Button3: TButton;
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    sList: TStringList;

    // changed code (in Frankfurt) to use the specific TObjectDictionary class
    // which allows objects ownership for either values or keys

    sDict: {TDictionary} TObjectDictionary<string,TMyObject>;
    // procedure ValueNotify(Sender: TObject; const Item: TMyObject;
    // Action: TCollectionNotification);
  public
    { Public declarations }
  end;

var
  FormLists: TFormLists;

implementation

{$R *.dfm}

uses
  Diagnostics;

function RandomName: string;
var
  i: Integer;
begin
  Result := '';
  for I := 1 to 30 + Random (50) do
    Result := Result + Char (Ord('a') + Random (26));
end;

procedure TFormLists.Button1Click(Sender: TObject);
var
  sw: TStopwatch;
  I: Integer;
  aName: string;
  anIndex: Integer;
  anObject: TMyObject;
  theTotal: integer;
begin
  sw.Reset;
  sw.Start;

  theTotal := 0;
  for I := 0 to sList.Count -1  do
  begin
    aName := sList[I];
    // now search for it
    anIndex := sList.IndexOf (aName);
    // get the object
    anObject := sList.Objects [anIndex] as TMyObject;
    Inc (theTotal, anObject.Value);
  end;

  sw.Stop;
  memo1.Lines.Add ('Total: ' + IntToStr (theTotal));
  memo1.Lines.Add ('StringList: ' + IntToStr (sw.ElapsedMilliseconds));
end;

procedure TFormLists.Button2Click(Sender: TObject);
var
  sw: TStopwatch;
  I: Integer;
  aName: string;
  anObject: TMyObject;
  theTotal: integer;
begin
  sw.Reset;
  sw.Start;

  theTotal := 0;
  for I := 0 to sList.Count -1  do
  begin
    aName := sList[I];
   // get the object
    anObject := sDict.Items [aName];
    Inc (theTotal, anObject.Value);
  end;

  sw.Stop;
  memo2.Lines.Add ('Total: ' + IntToStr (theTotal));
  memo2.Lines.Add ('Dictionary: ' + IntToStr (sw.ElapsedMilliseconds));
end;

procedure TFormLists.Button3Click(Sender: TObject);
var
  I: Integer;
  aName: string;
  anObject: TMyObject;
begin
  // else insertion is very slow
  sList.Sorted := False;

  for I := 1 to 500000 do // half million
  begin
    aName := RandomName;
    anObject := TMyObject.Create;
    anObject.Value := Random (200);
    sList.AddObject (aName, anObject);
    sDict.Add (aName, anObject);
    if (I mod 1000) = 0 then
      Application.ProcessMessages;
  end;
  Caption := Caption +  ' - ' + IntToStr (sList.Count);

  // else insertion is very slow
  sList.Sorted := True;
end;

procedure TFormLists.FormCreate(Sender: TObject);
begin
  sList := TStringList.Create;
  sDict :=  {TDictionary} TObjectDictionary<string,TMyObject>.
    Create ([doOwnsValues]);
  // sDict.OnValueNotify := ValueNotify;
  randomize;
end;

procedure TFormLists.FormDestroy(Sender: TObject);
begin
  sList.Free;
  sDict.Free;
end;

//procedure TForm1.ValueNotify(Sender: TObject; const Item: TMyObject;
//    Action: TCollectionNotification);
//begin
//  if Action = cnRemoved then
//    Item.Free;
//end;

{ TMyObject }

procedure TMyObject.SetValue(const Value: Integer);
begin
  FValue := Value;
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
