unit ReaderWriter_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormReaderWriter = class(TForm)
    btnWrite: TButton;
    btnRead: TButton;
    btnWriteAndRead: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    Label3: TLabel;
    btnXmlCorrect: TButton;
    btnXmlUnbalanced: TButton;
    btnClassic: TButton;
    procedure btnWriteClick(Sender: TObject);
    procedure btnReadClick(Sender: TObject);
    procedure btnWriteAndReadClick(Sender: TObject);
    procedure btnXmlCorrectClick(Sender: TObject);
    procedure btnXmlUnbalancedClick(Sender: TObject);
    procedure btnClassicClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReaderWriter: TFormReaderWriter;

implementation

{$R *.dfm}

uses
  Generics.Collections;

type
  TTrivialXmlWriter = class
  private
    fWriter: TTextWriter;
    fNodes: TStack<string>;
  public
    constructor Create (aWriter: TTextWriter);
    destructor Destroy; override;
    procedure WriteStartElement (const sName: string);
    procedure WriteEndElement;
    procedure WriteString (const sValue: string);
  end;


procedure TFormReaderWriter.btnWriteAndReadClick(Sender: TObject);
var
  sw: TStringWriter;
  sr: TStringReader;
  theString: string;
begin
  sw := TStringWriter.Create;
  try
    sw.WriteLine ('Hello, world');
    sw.WriteLine ('Have a nice day');
    sw.WriteLine (Left);
    theString := sw.ToString;
  finally
    sw.Free;
  end;

  sr := TStringReader.Create(theString);
  try
    while sr.Peek <> -1 do
      Memo1.Lines.Add (sr.ReadLine);
  finally
    sr.Free;
  end;
end;

procedure TFormReaderWriter.btnWriteClick(Sender: TObject);
var
  sw: TStreamWriter;
begin
  sw := TStreamWriter.Create(
    'test.txt', False, TEncoding.UTF8);
  try
    sw.WriteLine ('Hello, world');
    sw.WriteLine ('Have a nice day');
    sw.WriteLine (Left);
  finally
    sw.Free;
  end;
end;

procedure TFormReaderWriter.btnXmlCorrectClick(Sender: TObject);
var
  sw: TStringWriter;
  txw: TTrivialXmlWriter;
  theString: string;
begin
  sw := TStringWriter.Create;
  try
    txw := TTrivialXmlWriter.Create (sw);
    try
      txw.WriteStartElement('book');
        txw.WriteStartElement('title');
          txw.WriteString('Delphi 2009 Handbook');
        txw.WriteEndElement;
        txw.WriteStartElement('author');
          txw.WriteString('Marco Cantù');
        txw.WriteEndElement;
      txw.WriteEndElement;
    finally
       txw.Free;
    end;
    theString := sw.ToString;
  finally
    sw.Free;
  end;

  Memo1.Lines.Text := theString;
end;

procedure TFormReaderWriter.btnXmlUnbalancedClick(Sender: TObject);
var
  sw: TStringWriter;
  txw: TTrivialXmlWriter;
  theString: string;
begin
  sw := TStringWriter.Create;
  try
    txw := TTrivialXmlWriter.Create (sw);
    try
      txw.WriteStartElement('book');
        txw.WriteStartElement('title');
          txw.WriteString('Delphi 2009 Handbook');
//        txw.WriteEndElement;
        txw.WriteStartElement('author');
          txw.WriteString('Marco Cantù');
//        txw.WriteEndElement;
//      txw.WriteEndElement;
    finally
       txw.Free;
    end;
    theString := sw.ToString;
  finally
    sw.Free;
  end;

  Memo1.Lines.Text := theString;end;

procedure TFormReaderWriter.btnClassicClick(Sender: TObject);
var
  fs: TFileStream;
  str: AnsiString;
begin
  if FileExists ('test.txt') then
    fs := TFileStream.Create('test.txt', fmCreate)
  else
    fs := TFileStream.Create('test.txt', fmOpenReadWrite);
  try
    str := 'Hello, world';
    fs.write (str[1], Length (str));
    str := sLineBreak;
    fs.write (str[1], Length (str));
    str := IntToStr (Left);
    fs.write (str[1], Length (str));
  finally
    fs.Free;
  end;
end;

procedure TFormReaderWriter.btnReadClick(Sender: TObject);
var
  sr: TStreamReader;
begin
  sr := TStreamReader.Create('test.txt', True);
  try
    while not sr.EndOfStream do
      Memo1.Lines.Add (sr.ReadLine);
  finally
    sr.Free;
  end;
end;

{ TTrivialXmlWriter }

constructor TTrivialXmlWriter.Create(aWriter: TTextWriter);
begin
  fWriter := aWriter;
  fNodes := TStack<string>.Create;
end;

destructor TTrivialXmlWriter.Destroy;
begin
  while fNodes.Count > 0 do
    WriteEndElement;
  fNodes.Free;
  inherited;
end;

procedure TTrivialXmlWriter.WriteEndElement;
begin
  fWriter.Write('</' + fNodes.Pop + '>');
end;

procedure TTrivialXmlWriter.WriteStartElement(const sName: string);
begin
  fWriter.Write('<' + sName + '>');
  fNodes.Push (sname);
end;

procedure TTrivialXmlWriter.WriteString(const sValue: string);
begin
  fWriter.Write(sValue);
end;

end.
