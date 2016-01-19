unit CallBackForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFormCallBack = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
  private
    class var
      nTimerCount: Integer;
  public
    class procedure TimerCallBack (hwnd: THandle; uMsg, idEvent, dwTime: Cardinal); static; stdcall;
  end;

var
  FormCallBack: TFormCallBack;

implementation

{$R *.dfm}

const
  TIMERID = 100;

procedure TFormCallBack.FormCreate(Sender: TObject);
var
  callback: TFNTimerProc;
begin
  nTimerCount := 0;
  callback := TFNTimerProc(@TFormCallBack.TimerCallBack);
  SetTimer(Handle, TIMERID, 1000, callback);
end;

class procedure TFormCallBack.TimerCallBack(hwnd: THandle; uMsg, idEvent,
  dwTime: Cardinal);
begin
  try
    Inc (nTimerCount);
    FormCallBack.ListBox1.Items.Add (IntToStr (nTimerCount) + ' at ' + TimeToStr(Now));
  except on E: Exception do
    Application.HandleException(nil);
  end;
end;

end.
