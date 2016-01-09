unit HelloPlatformForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
  {$IFDEF IOS}
    ShowMessage ('Running on iOS');
  {$ENDIF}

  {$IFDEF ANDROID}
    ShowMessage ('Running on Android');
  {$ENDIF}

  {$IFDEF MSWINDOWS}
    ShowMessage ('Running on Windows');
  {$ENDIF}
end;

end.
