unit CustomerClasses;

interface

uses
  Classes, Generics.Collections, DB;

{$M+}

type
  TCustomerKey = class
  private
    FCustNo: Double;
    FCompany: string;
    procedure SetCompany(const Value: string);
    procedure SetCustNo(const Value: Double);
  published
    property CustNo: Double read FCustNo write SetCustNo;
    property Company: string read FCompany write SetCompany;
  end;

  TCustomer = class
  private
    FCustNo: Double;
    FFAX: string;
    FZip: string;
    FState: string;
    FCompany: string;
    FPhone: string;
    FCountry: string;
    FAddr1: string;
    FCity: string;
    FContact: string;
    fInitDone: Boolean;
    FCustKey: TCustomerKey;
    procedure SetAddr1(const Value: string);
    procedure SetCity(const Value: string);
    procedure SetCompany(const Value: string);
    procedure SetContact(const Value: string);
    procedure SetCountry(const Value: string);
    procedure SetCustNo(const Value: Double);
    procedure SetFAX(const Value: string);
    procedure SetPhone(const Value: string);
    procedure SetState(const Value: string);
    procedure SetZip(const Value: string);
    procedure SetCustKey(const Value: TCustomerKey);
    function GetAddr1: string;
    function GetCity: string;
    function GetCompany: string;
    function GetContact: string;
    function GetCountry: string;
    function GetCustNo: Double;
    function GetFAX: string;
    function GetPhone: string;
    function GetState: string;
    function GetZip: string;
    procedure Init;
    procedure EnforceInit;
  public
    constructor Create (aCustKey: TCustomerKey);
    property CustKey: TCustomerKey read FCustKey write SetCustKey;
  published
    property CustNo: Double read GetCustNo write SetCustNo;
    property Company: string read GetCompany write SetCompany;
    property Addr1: string read GetAddr1 write SetAddr1;
    property City: string read GetCity write SetCity;
    property State: string read GetState write SetState;
    property Zip: string read GetZip write SetZip;
    property Country: string read GetCountry write SetCountry;
    property Phone: string read GetPhone write SetPhone;
    property FAX: string read GetFAX write SetFAX;
    property Contact: string read GetContact write SetContact;
  class var
    RefDataSet: TDataSet;
  end;

  TCustomerDictionary = class (TObjectDictionary <TCustomerKey, TCustomer>)
  public
    procedure LoadFromDataSet (dataset: TDataSet);
  end;

{$M-}


implementation

{ TCustomer }

constructor TCustomer.Create(aCustKey: TCustomerKey);
begin
  FCustKey := aCustKey;
end;

procedure TCustomer.EnforceInit;
begin
  if not fInitDone then
    Init;
end;

function TCustomer.GetAddr1: string;
begin
  EnforceInit;
  Result := FAddr1;
end;

function TCustomer.GetCity: string;
begin
  EnforceInit;
  Result := FCity;
end;

function TCustomer.GetCompany: string;
begin
  EnforceInit;
  Result := FCompany;
end;

function TCustomer.GetContact: string;
begin
  EnforceInit;
  Result := FContact;
end;

function TCustomer.GetCountry: string;
begin
  EnforceInit;
  Result := FCountry;
end;

function TCustomer.GetCustNo: Double;
begin
  EnforceInit;
  Result := FCustNo;
end;

function TCustomer.GetFAX: string;
begin
  EnforceInit;
  Result := FFAX;
end;

function TCustomer.GetPhone: string;
begin
  EnforceInit;
  Result := FPhone;
end;

function TCustomer.GetState: string;
begin
  EnforceInit;
  Result := FState;
end;

function TCustomer.GetZip: string;
begin
  EnforceInit;
  Result := FZip;
end;

procedure TCustomer.Init;
begin
  RefDataSet.Locate('custno', CustKey.CustNo, []);
  // could also load each published field via RTTI
  FCustNo := RefDataSet.FieldByName ('CustNo').AsFloat;
  FFAX := RefDataSet.FieldByName ('FAX').AsString;
  FZip := RefDataSet.FieldByName ('Zip').AsString;
  FState := RefDataSet.FieldByName ('State').AsString;
  FCompany := RefDataSet.FieldByName ('Company').AsString;
  FPhone := RefDataSet.FieldByName ('Phone').AsString;
  FCountry := RefDataSet.FieldByName ('Country').AsString;
  FAddr1 := RefDataSet.FieldByName ('Addr1').AsString;
  FCity := RefDataSet.FieldByName ('City').AsString;
  FContact := RefDataSet.FieldByName ('Contact').AsString;
  fInitDone := True;
end;

procedure TCustomer.SetAddr1(const Value: string);
begin
  FAddr1 := Value;
end;

procedure TCustomer.SetCity(const Value: string);
begin
  FCity := Value;
end;

procedure TCustomer.SetCompany(const Value: string);
begin
  FCompany := Value;
end;

procedure TCustomer.SetContact(const Value: string);
begin
  FContact := Value;
end;

procedure TCustomer.SetCountry(const Value: string);
begin
  FCountry := Value;
end;

procedure TCustomer.SetCustKey(const Value: TCustomerKey);
begin
  FCustKey := Value;
end;

procedure TCustomer.SetCustNo(const Value: Double);
begin
  FCustNo := Value;
end;

procedure TCustomer.SetFAX(const Value: string);
begin
  FFAX := Value;
end;

procedure TCustomer.SetPhone(const Value: string);
begin
  FPhone := Value;
end;

procedure TCustomer.SetState(const Value: string);
begin
  FState := Value;
end;

procedure TCustomer.SetZip(const Value: string);
begin
  FZip := Value;
end;

{ TCustomerKey }

procedure TCustomerKey.SetCompany(const Value: string);
begin
  FCompany := Value;
end;

procedure TCustomerKey.SetCustNo(const Value: Double);
begin
  FCustNo := Value;
end;

{ TCustomerDictionary }

procedure TCustomerDictionary.LoadFromDataSet(dataset: TDataSet);
var
  custKey: TCustomerKey;
begin
  TCustomer.RefDataSet := dataset;

  dataset.First;
  while not dataset.EOF do
  begin
    custKey := TCustomerKey.Create;
    custKey.CustNo := dataset ['CustNo'];
    custKey.Company := dataset ['Company'];
    self.Add(custKey, TCustomer.Create (custKey));
    dataset.Next;
  end;
end;

end.
