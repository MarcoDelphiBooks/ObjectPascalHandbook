unit TypeCompRules_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm30 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    btnGlobal: TButton;
    Memo1: TMemo;
    btnOtherUnit: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnGlobalClick(Sender: TObject);
    procedure btnOtherUnitClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure Log (const strMsg: string);
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

type
  TArrayOf10 = array [1..10] of Integer;

type
  TGenericArray<T> = class
    anArray: array [1..10] of T;
  end;

  TIntGenericArray = TGenericArray<Integer>;

implementation

uses
  TypInfo, TypeCompRules_OtherUnit;

{$R *.dfm}


procedure TForm30.btnOtherUnitClick(Sender: TObject);
var
  array1: TIntGenericArray;
  array2: TypeCompRules_OtherUnit.TAntoherIntGenericArray;
begin
  array1 := TIntGenericArray.Create;
  array1 := array2;
end;

procedure TForm30.Button1Click(Sender: TObject);
var
  array1: TArrayOf10;
  array2: TArrayOf10;
  array3, array4: array [1..10] of Integer;
begin
  array1 := array2;
  // array2 := array3; // E2010 Incompatible types: 'TArrayOf10' and 'Array'
  array3 := array4;
  // array4 := array1; // E2010 Incompatible types: 'Array' and 'TArrayOf10'
end;

procedure TForm30.Button2Click(Sender: TObject);
var
  array1: TIntGenericArray;
  array2: TIntGenericArray;
  array3, array4: TGenericArray<Integer>;
begin
  array1 := TIntGenericArray.Create;
  array1.anArray[1] := 10; // assignment used... to avoid a warning
  array2 := array1;
  array2.anArray[2] := 10;
  array3 := array2;
  array3.anArray[3] := 10;
  array4 := array3;
  array4.anArray[4] := 10;
  array1 := array4;
  array1.anArray[5] := 10;
end;

type
  TSimpleGeneric<T> = class
    Value: T;
  end;

procedure TForm30.Button3Click(Sender: TObject);
var
  sg1: TSimpleGeneric<string>;
  sg2: TSimpleGeneric<Integer>;
begin
  sg1 := TSimpleGeneric<string>.Create;
  sg2 := TSimpleGeneric<Integer>.Create;

  sg1.Value := 'foo';
//  sg1.Value := 10; // E2010 Incompatible types: 'string' and 'Integer'

//  sg2.Value := 'foo';  // E2010 Incompatible types: 'Integer' and 'string'
  sg2.Value := 10;

  sg1.Free;
  sg2.Free;

//  sg1 := TSimpleGeneric<Integer>.Create; // E2010 Incompatible types: 'TSimpleGeneric<System.string>' and 'TSimpleGeneric<System.Integer>'
end;

type
  TGlobalFunction<T> = class
  public
    class function AlmostGlobal: string;
    class function WithParam (t1: T): string;
  end;

// this is testing code that shoudl have been removed from the demo...
type TFoo = class
  procedure Test (integer: Integer);
end;

procedure TFoo.Test(integer: Integer);
//var
//  I: Integer;
begin
  ShowMessage (IntToStr (integer));
end;

procedure TForm30.btnGlobalClick(Sender: TObject);
begin
  Log (TGlobalFunction<string>.AlmostGlobal);
  Log (TGlobalFunction<Int64>.AlmostGlobal);
  Log (TGlobalFunction<TButton>.AlmostGlobal);
  Log (TGlobalFunction<TButton>.WithParam (btnGlobal));
  Log (TGlobalFunction<string>.WithParam ('foo'));
//  Log (TGlobalFunction<Integer>.WithParam (btnGlobal)); // [DCC Error] TypeCompRules_MainForm.pas(100): E2010 Incompatible types: 'Integer' and 'TButton'
//  Log (TGlobalFunction<string>.WithParam (203)); // [DCC Error] TypeCompRules_MainForm.pas(101): E2010 Incompatible types: 'string' and 'Integer'

  // this is testing code that shoudl have been removed from the demo...
  with TFoo.Create do
  try
    Test (10);
  finally
    Free;
  end;
end;

procedure TForm30.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

{ TGlobalFunction<T> }

class function TGlobalFunction<T>.AlmostGlobal: string;
begin
  Result := string(PTypeInfo (TypeInfo (T)).Name) + ': ' +
    IntToStr (SizeOf (T));
end;

class function TGlobalFunction<T>.WithParam (t1: T): string;
begin
  // what can I do with t1?
  Result := string(PTypeInfo (TypeInfo (T)).Name) + ': ' +
    IntToStr (SizeOf (T));
end;

{ TFoo }


end.
