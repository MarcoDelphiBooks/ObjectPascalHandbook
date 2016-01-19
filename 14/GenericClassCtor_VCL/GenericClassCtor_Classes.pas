unit GenericClassCtor_Classes;

interface

uses
  Classes;

type
  TGenericWithClassCtor <T> = class
  private
    FData: T;
    procedure SetData(const Value: T);
  public
    class constructor Create;
    property Data: T read FData write SetData;
    class var
      DataSize: Integer;
  end;

  function ListSequence: TStringList;

//  procedure Useless; // not really needed

implementation

var // one for the unit (shared by all geenrics)
  sListSequence: TStringList;

function ListSequence: TStringList;
begin
  if not Assigned (sListSequence) then
    sListSequence := TStringList.Create;
  Result := sListSequence;
end;

// uncomment to show a double initialization
//procedure Useless;
//var
//  genStr: TGenericWithClassCtor <string>;
//begin
//  genStr := TGenericWithClassCtor <string>.Create;
//  genStr.Data := '100';
//  genStr.Free;
//end;

{ TGenericWithClassCtor<T> }

class constructor TGenericWithClassCtor<T>.Create;
begin
  DataSize := SizeOf (T);
  ListSequence.Add(ClassName);
end;

procedure TGenericWithClassCtor<T>.SetData(const Value: T);
begin
  FData := Value;
end;

end.
