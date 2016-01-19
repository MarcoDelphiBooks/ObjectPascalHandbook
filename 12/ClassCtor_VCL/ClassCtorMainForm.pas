unit ClassCtorMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm39 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form39: TForm39;

implementation

{$R *.dfm}

type
  TTestClass = class
  public
  class var
    StartTime: TDateTime;
    EndTime: TDateTime;
  public
    class constructor Create;
//    class constructor Foo;
    class destructor Destroyer;
  end;



procedure TForm39.Button1Click(Sender: TObject);
begin
  ShowMessage (TimeToStr (TTestClass.StartTime));
end;

{ TTestClass }

class constructor TTestClass.Create;
begin
  StartTime := Now;
end;

class destructor TTestClass.Destroyer;
begin
  EndTime := Now;
end;

//class constructor TTestClass.Foo;
//begin
//  ShowMessage ('Foo');
//end;

initialization
  ShowMessage (TimeToStr (TTestClass.StartTime));

finalization
  ShowMessage (TimeToStr (TTestClass.EndTime));

end.
