unit NestedClass;

interface

type
  TOne = class
  private
    someData: Integer;
  public
    // nested constant
    const foo = 12;
    // nested type
    type TInside = class
      type TInsideInside = class
        procedure Two;
      end;
    public
      procedure InsideHello;
    private
      Msg: string;
      InsIns: TInsideInside;
    end;
  public
    procedure Hello;
    constructor Create;
  end;

implementation

uses
  SysUtils, NestedTypesForm;

{ TOne }

constructor TOne.Create;
begin
  inherited Create;
end;

procedure TOne.Hello;
var
  ins: TInside;
begin
  ins := TInside.Create;
  try
    ins.Msg := 'hi';
    ins.InsideHello;
    Show ('constant is ' + IntToStr (foo));
  finally
    ins.Free;
  end;
end;

{ TOne.TInside }

procedure TOne.TInside.InsideHello;
begin
   msg := 'new msg';
   Show ('internal call');
   if not Assigned (InsIns) then
     InsIns := TInsideInside.Create;
   InsIns.Two;
end;

{ TOne.TInside.TInsideInside }

procedure TOne.TInside.TInsideInside.Two;
begin
  Show ('this is a method of a nested/nested class');
end;

end.
