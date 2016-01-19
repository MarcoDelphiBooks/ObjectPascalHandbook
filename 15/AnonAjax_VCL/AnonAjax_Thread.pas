unit AnonAjax_Thread;

interface

uses
  Classes, SysUtils, StrUtils, IdHttp;

type
  TAjaxCallback = reference to procedure (aResponseContent: TStringStream);
  TLinkCallback = reference to procedure (const strLink: string);

  TAjaxThread = class (TThread)
  private
    fIdHttp: TIdHttp;
    fURL: string;
    fAjaxCallback: TAjaxCallback;
  protected
    procedure Execute; override;
  public
    constructor Create (const strUrl: string;
      ajaxCallback: TAjaxCallback);
    destructor Destroy; override;
  end;

procedure AjaxCall (const strUrl: string; ajaxCallback: TAjaxCallback);
procedure ExtractLinks (strData: string; procLink: TLinkCallback);
procedure ExtractImages (strData: string; procLink: TLinkCallback);


implementation

procedure AjaxCall (const strUrl: string;
  ajaxCallback: TAjaxCallback);
begin
  TAjaxThread.Create (strUrl, ajaxCallback);
end;

{ TAjaxThread }

constructor TAjaxThread.Create(const strUrl: string;
  ajaxCallback: TAjaxCallback);
begin
  fIdHttp := TIdHTTP.Create(nil);
  fURL := strUrl;
  fAjaxCallback := ajaxCallBack;
  inherited Create (False);
  FreeOnTerminate := True;
end;

destructor TAjaxThread.Destroy;
begin
  fIdHttp.Free;
  inherited;
end;

procedure TAjaxThread.Execute;
var
  aResponseContent: TStringStream;
begin
  aResponseContent := TStringStream.Create;
  try
    fIdHttp.Get (fURL, aResponseContent);
    aResponseContent.Position := 0;
    fAjaxCallback (aResponseContent);
  finally
    aResponseContent.Free;
  end;
end;

procedure ExtractLinks (strData: string; procLink: TLinkCallback);
var
  strAddr: string;
  nBegin, nEnd: Integer;
begin
  strData := LowerCase (strData);
  nBegin := 1;
  repeat
    nBegin := PosEx ('href="http', strData, nBegin);
    if nBegin <> 0 then
    begin
      // find the end of the reference
      nBegin := nBegin + 6;
      nEnd := PosEx ('"', strData, nBegin);
      strAddr := Copy (strData, nBegin, nEnd - nBegin);
      // move on
      nBegin := nEnd + 1;
      // execute anon method
      procLink (strAddr)
    end;
  until nBegin = 0;
end;

procedure ExtractImages (strData: string; procLink: TLinkCallback);
var
  strAddr: string;
  nBegin, nEnd: Integer;
begin
  strData := LowerCase (strData);
  nBegin := 1;
  repeat
    nBegin := PosEx ('<img src="', strData, nBegin);
    if nBegin <> 0 then
    begin
      // find the end of the reference
      nBegin := nBegin + 10;
      nEnd := PosEx ('"', strData, nBegin);
      strAddr := Copy (strData, nBegin, nEnd - nBegin);
      // move on
      nBegin := nEnd + 1;
      // execute anon method
      procLink (strAddr)
    end;
  until nBegin = 0;
end;


end.
