program ClassStatic;

{$APPTYPE CONSOLE}

uses
  SysUtils, Windows;

type
  TBase = class
  private
    tmp: Integer;
    class var
      fMyName: string;
  public
    class procedure One;
    class procedure Two; static;
    class function GetMyName: string; static;
    class procedure SetMyName (Value: string); static;
    class property MyName: string read GetMyName write SetMyName;
    class property DirectName: string read fMyName write fMyName;
  end;

// replace class data with local data
//var
//  fMyName: string;

class procedure TBase.One;
begin
  // Error: Instance member 'tmp' inaccessible here
  // writeln (tmp);
  writeln ('one');
  writeln (self.ClassName);
end;

class procedure TBase.Two;
begin
  writeln ('two');
  // error: Undeclared identifier: 'self'
  // writeln (self.ClassName);
  writeln (ClassName);
end;

class function TBase.GetMyName: string;
begin
  Result := fMyName;
end;

class procedure TBase.SetMyName (Value: string);
begin
  fMyName := Value;
end;

var
  base: TBase;

begin
  // TBase.MyName := 'hi';
  TBase.One;
  TBase.Two;

  base := TBase.Create;
  base.One;
  base.Two;

  //writeln (base.myname);

  readln;
end.

