unit XmlPersistAttrib_Classes;

interface

uses
  Classes, TrivialXmlWriter;

type
  TAttrPerson = class
  private
    [xml ('Name')]
    FName: string;
    [xml]
    FCountry: string;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
  end;

  TAttrCompany = class
  private
    [xml ('CompanyName')]
    FName: string;
    [xml ('Country')]
    FCountry: string;
    FID: string; // omitted
    [xml ('TheBoss')]
    FPerson: TAttrPerson;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
    property ID: string read FID write FID;
    property Boss: TAttrPerson read FPerson write FPerson;
  end;

implementation

end.
