unit XmlPersistPublish_Classes;

interface

uses
  Classes;

type
  TPerson = class (TPersistent)
  private
    FName: string;
    FCountry: string;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
  end;

  TCompany = class (TPersistent)
  private
    FName: string;
    FCountry: string;
    FID: string;
    FPerson: TPerson;
  published
    property Name: string read FName write FName;
    property Country: string read FCountry write FCountry;
    property ID: string read FID write FID;
    property Boss: TPerson read FPerson write FPerson;
  end;


implementation


end.
