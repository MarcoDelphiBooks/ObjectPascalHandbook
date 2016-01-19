unit FindTh;

interface

uses
  Classes, IdComponent, SysUtils, StrUtils, IdHTTP;

type
  TFindWebThread = class(TThread)
  protected
    Addr, Text, Status: string;
    procedure Execute; override;
    procedure AddToList;
    procedure ShowStatus;
    procedure GrabHtml;
    procedure HtmlToList;
    procedure HttpWork (Sender: TObject;
      AWorkMode: TWorkMode; AWorkCount: Int64);
  public
    strUrl: string;
    strRead: string;
  end;

  TFindWebThreadAnon = class(TThread)
  protected
    procedure Execute; override;
    procedure GrabHtml;
    procedure HtmlToList;
    procedure HttpWork (Sender: TObject;
      AWorkMode: TWorkMode; AWorkCount: Int64);
  public
    strUrl: string;
    strRead: string;
  end;



implementation

{ TFindWebThread }

uses
  WebFindF, IdUri;

procedure TFindWebThread.AddToList;
begin
  if Form1.ListBox1.Items.IndexOf (Addr) < 0 then
  begin
    Form1.ListBox1.Items.Add (Addr);
    Form1.DetailsList.Add (Text);
  end;
end;

procedure TFindWebThread.Execute;
begin
  GrabHtml;
  HtmlToList;
  Status := 'Done with ' + StrUrl;
  Synchronize (ShowStatus);
end;

procedure TFindWebThread.GrabHtml;
var
  Http1: TIdHTTP;
begin
  Status := 'Sending query: ' + StrUrl;
  Synchronize (ShowStatus);
  // encode extended characters
  strUrl := TIdUri.URLEncode(StrUrl);
  Http1 := TIdHTTP.Create (nil);
  try
    Http1.Request.UserAgent := 'User-Agent: NULL';
    Http1.OnWork := HttpWork;
    strRead := Http1.Get (StrUrl);
  finally
    Http1.Free;
  end;
end;

procedure TFindWebThread.HtmlToList;
var
  strAddr, strText: string;
  nText: integer;
  nBegin, nEnd: Integer;
begin
  Status := 'Extracting data for: ' + StrUrl;
  Synchronize (ShowStatus);
  strRead := LowerCase (strRead);
  nBegin := 1;
  repeat
    // find the initial part HTTP reference
    // was:     nBegin := PosEx ('href=http', strRead, nBegin);
    nBegin := PosEx ('href="http', strRead, nBegin);
    if nBegin <> 0 then
    begin
      // find the end of the href tag (closing quotes)
      nBegin := nBegin + 6;
      nEnd := PosEx ('"', strRead, nBegin);
      strAddr := Copy (strRead, nBegin, nEnd - nBegin);

      // move on
      nBegin := PosEx ('>', strRead, nEnd) + 1;
      // add the URL if 'google' is not in it
      if Pos ('google', strAddr) = 0 then
      begin
        nText := PosEx ('</a>', strRead, nBegin);
        strText := copy (strRead, nBegin, nText - nBegin);
        // remove cached references and duplicates
        if (Pos ('cache', strText) = 0) then
        begin
          Addr := strAddr;
          Text := strText;
          Synchronize (AddToList);
        end;
      end;
    end;
  until nBegin = 0;
end;

procedure TFindWebThread.HttpWork(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Status := 'Received ' + IntToStr (AWorkCount) + ' for ' + strUrl;
  Synchronize (ShowStatus);
end;

procedure TFindWebThread.ShowStatus;
begin
  Form1.StatusBar1.SimpleText := Status;
end;

{ TFindWebThreadAnon }


procedure TFindWebThreadAnon.Execute;
begin
  GrabHtml;
  HtmlToList;
  Synchronize (
    procedure
      begin
        Form1.StatusBar1.SimpleText := 'Done with ' + StrUrl;
      end );
end;

procedure TFindWebThreadAnon.GrabHtml;
var
  Http1: TIdHTTP;
begin
  Synchronize (
    procedure
      begin
        Form1.StatusBar1.SimpleText := 'Sending query: ' + StrUrl;
      end );

  // encode extended characters
  strUrl := TIdUri.URLEncode(StrUrl);
  Http1 := TIdHTTP.Create (nil);
  try
    Http1.Request.UserAgent := 'User-Agent: NULL';
    Http1.OnWork := HttpWork;
    strRead := Http1.Get (StrUrl);
  finally
    Http1.Free;
  end;
end;

procedure TFindWebThreadAnon.HtmlToList;
var
  strAddr, strText: string;
  nText: integer;
  nBegin, nEnd: Integer;
begin
  Synchronize (
    procedure
      begin
        Form1.StatusBar1.SimpleText := 'Extracting data for: ' + StrUrl;
      end );

  strRead := LowerCase (strRead);
  nBegin := 1;
  repeat
    // find the initial part HTTP reference
    // was:     nBegin := PosEx ('href=http', strRead, nBegin);
    nBegin := PosEx ('href="http', strRead, nBegin);
    if nBegin <> 0 then
    begin
      // find the end of the href tag (closing quotes)
      nBegin := nBegin + 6;
      nEnd := PosEx ('"', strRead, nBegin);
      strAddr := Copy (strRead, nBegin, nEnd - nBegin);

      // move on
      nBegin := PosEx ('>', strRead, nEnd) + 1;
      // add the URL if 'google' is not in it
      if Pos ('google', strAddr) = 0 then
      begin
        nText := PosEx ('</a>', strRead, nBegin);
        strText := copy (strRead, nBegin, nText - nBegin);
        // remove cached references and duplicates
        if (Pos ('cache', strText) = 0) then
        begin
          Synchronize (
            procedure
            begin
              if Form1.ListBox1.Items.IndexOf (strAddr) < 0 then
              begin
                Form1.ListBox1.Items.Add (strAddr);
                Form1.DetailsList.Add (strText);
              end;
            end );
        end;
      end;
    end;
  until nBegin = 0;
end;

procedure TFindWebThreadAnon.HttpWork(Sender: TObject; AWorkMode: TWorkMode;
  AWorkCount: Int64);
begin
  Synchronize (
    procedure
      begin
        Form1.StatusBar1.SimpleText :=
          'Received ' + IntToStr (AWorkCount) + ' for ' + strUrl;
      end );
end;

end.
