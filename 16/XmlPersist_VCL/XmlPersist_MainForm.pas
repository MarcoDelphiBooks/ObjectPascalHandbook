unit XmlPersist_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, xmldom, XMLIntf, msxmldom, XMLDoc;

type
  TFormXmlPersist = class(TForm)
    btnPublished: TButton;
    Memo1: TMemo;
    btnRtti: TButton;
    btnAttributes: TButton;
    procedure btnPublishedClick(Sender: TObject);
    procedure btnRttiClick(Sender: TObject);
    procedure btnAttributesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormXmlPersist: TFormXmlPersist;

implementation

{$R *.dfm}

uses
  TrivialXmlWriter, XmlPersistPublish_Classes,
  XmlPersistRtti_Classes, XmlPersistAttrib_Classes;

procedure TFormXmlPersist.btnAttributesClick(Sender: TObject);
var
  aPerson: TAttrPerson;
  aCompany: TAttrCompany;
  ss: TStringStream;
  xmlWri: TTrivialXmlWriter;
begin
  // create a person
  aPerson := TAttrPerson.Create;
  aPerson.Name := 'Wiley';
  aPerson.Country := 'Desert';

  // create a company and add person to it
  aCompany := TAttrCompany.Create;
  aCompany.Name := 'ACME Inc.';
  aCompany.ID := IntToStr (GetTickCount);
  aCompany.Country := 'Worldwide';
  aCompany.Boss := aPerson;

  // stream the company (and person)
  ss := TStringStream.Create;
  try
    xmlWri := TTrivialXmlWriter.Create (ss);
    try
      xmlWri.WriteStartElement('company');
      xmlWri.WriteObjectAttrib(aCompany);
      xmlWri.WriteEndElement;
    finally
       xmlWri.Free;
    end;
    // reset and laod stream
    ss.Position := 0;
    Memo1.Lines.LoadFromStream (ss);
  finally
    ss.Free;
  end;end;

procedure TFormXmlPersist.btnPublishedClick(Sender: TObject);
var
  aPerson: TPerson;
  aCompany: TCompany;
  ss: TStringStream;
  xmlWri: TTrivialXmlWriter;
begin
  // create a person
  aPerson := TPerson.Create;
  aPerson.Name := 'Wiley';
  aPerson.Country := 'Desert';

  // create a company and add person to it
  aCompany := TCompany.Create;
  aCompany.Name := 'ACME Inc.';
  aCompany.ID := IntToStr (GetTickCount);
  aCompany.Country := 'Worldwide';
  aCompany.Boss := aPerson;

  // stream the company (and person)
  ss := TStringStream.Create;
  try
    xmlWri := TTrivialXmlWriter.Create (ss);
    try
      xmlWri.WriteStartElement('company');
      xmlWri.WriteObjectPublished(aCompany);
      xmlWri.WriteEndElement;
    finally
       xmlWri.Free;
    end;
    // reset and laod stream
    ss.Position := 0;
    Memo1.Lines.LoadFromStream (ss);
  finally
    ss.Free;
  end;
end;

procedure TFormXmlPersist.btnRttiClick(Sender: TObject);
var
  aPerson: TNewPerson;
  aCompany: TNewCompany;
  ss: TStringStream;
  xmlWri: TTrivialXmlWriter;
begin
  // create a person
  aPerson := TNewPerson.Create;
  aPerson.Name := 'Wiley';
  aPerson.Country := 'Desert';

  // create a company and add person to it
  aCompany := TNewCompany.Create;
  aCompany.Name := 'ACME Inc.';
  aCompany.ID := IntToStr (GetTickCount);
  aCompany.Country := 'Worldwide';
  aCompany.Boss := aPerson;

  // stream the company (and person)
  ss := TStringStream.Create;
  try
    xmlWri := TTrivialXmlWriter.Create (ss);
    try
      xmlWri.WriteStartElement('company');
      xmlWri.WriteObjectRtti(aCompany);
      xmlWri.WriteEndElement;
    finally
       xmlWri.Free;
    end;
    // reset and laod stream
    ss.Position := 0;
    Memo1.Lines.LoadFromStream (ss);
  finally
    ss.Free;
  end;
end;

end.
