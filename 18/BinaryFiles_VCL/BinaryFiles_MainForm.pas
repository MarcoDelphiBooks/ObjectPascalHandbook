unit BinaryFiles_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormBinary = class(TForm)
    btnWrite: TButton;
    btnRead: TButton;
    Memo1: TMemo;
    btnWriteRecord: TButton;
    btnReadRecord: TButton;
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteRecordClick(Sender: TObject);
    procedure btnReadRecordClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Log (const strMsg: string);
  public
    { Public declarations }
  end;

  TMyRecord = record
    one: Integer;
    two: Integer;
    three: Double;
  end;

var
  FormBinary: TFormBinary;

implementation

{$R *.dfm}

uses
  RTTI, TypInfo;

// keep this around for memory management and caching
var
  context: TRTTIContext;
  recType: TRTTIRecordType;

procedure WriteRecordBinary (recordType: TRttiRecordType; instance: Pointer;
  bw: TBinaryWriter);
var
  field: TRttiField;
begin
  for field in recordType.GetFields do
  begin
    case field.FieldType.TypeKind of
      tkInteger: bw.Write (field.GetValue(instance).AsInteger);
      tkFloat: bw.Write (field.GetValue(instance).AsType <Double>);
    end;
  end;
end;

procedure ReadRecordBinary (recordType: TRttiRecordType; instance: Pointer;
  br: TBinaryReader);
var
  field: TRttiField;
begin
  for field in recordType.GetFields do
  begin
    case field.FieldType.TypeKind of
      tkInteger: field.SetValue(instance, br.ReadInteger);
      tkFloat: field.SetValue(instance, br.ReadDouble);
    end;
  end;
end;


procedure TFormBinary.btnWriteClick(Sender: TObject);
var
  bw: TBinaryWriter;
begin
  bw := TBinaryWriter.Create('test.data', False);
  try
    bw.Write(Left);
    bw.Write(Now);
    Log ('File size: ' + IntToStr (bw.BaseStream.Size));
  finally
    bw.Free;
  end;
end;

procedure TFormBinary.btnWriteRecordClick(Sender: TObject);
var
  bw: TBinaryWriter;
  rec: TMyRecord;
begin
  rec.one := 1;
  rec.two := 2;
  rec.three := 3.3;

  bw := TBinaryWriter.Create('record.data', False);
  try
    WriteRecordBinary (recType, @rec, bw);
//    bw.Write(rec.one);
//    bw.Write(rec.two);
//    bw.Write(rec.three);
    Log ('File size: ' + IntToStr (bw.BaseStream.Size));
  finally
    bw.Free;
  end;
end;

procedure TFormBinary.FormCreate(Sender: TObject);
begin
  recType := context.GetType(TypeInfo (TMyRecord)) as TRTTIRecordType;
end;

procedure TFormBinary.btnReadRecordClick(Sender: TObject);
var
  br: TBinaryReader;
  rec: TMyRecord;
begin
  br := TBinaryReader.Create('record.data');
  try
    ReadRecordBinary(recType, @rec, br);
//    rec.one := br.ReadInteger;
//    rec.two := br.ReadInteger;
//    rec.three := br.ReadDouble;
    Log ('Two: ' + IntToStr (rec.two));
  finally
    br.Free;
  end;
end;

procedure TFormBinary.btnReadClick(Sender: TObject);
var
  br: TBinaryReader;
  time: TDateTime;
begin
  br := TBinaryReader.Create('test.data');
  try
    Left := br.ReadInt32;
    Log ('Left read: ' + IntToStr (Left));
    time := br.ReadDouble;
    Log ('Time read: ' + TimeToStr (time));
  finally
    br.Free;
  end;
end;

procedure TFormBinary.Log(const strMsg: string);
begin
  Memo1.Lines.Add (strMsg);
end;

end.
