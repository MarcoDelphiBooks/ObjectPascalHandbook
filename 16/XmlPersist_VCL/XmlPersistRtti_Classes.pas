unit XmlPersistRtti_Classes;

interface

uses
  Classes;

type
  TNewPerson = class
  private
    FName: string;
    FCountry: string;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
  end;

  TNewCompany = class
  private
    FName: string;
    FCountry: string;
    FID: string;
    FPerson: TNewPerson;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
    property ID: string read FID write FID;
    property Boss: TNewPerson read FPerson write FPerson;
  end;

implementation

end.
