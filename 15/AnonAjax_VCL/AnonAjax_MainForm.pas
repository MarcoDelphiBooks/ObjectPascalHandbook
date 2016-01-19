unit AnonAjax_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, GIFImg;

type
  TFormAnonAjax = class(TForm)
    btnRead: TButton;
    Memo1: TMemo;
    edUrl: TEdit;
    Image1: TImage;
    btnLinks: TButton;
    btnImages: TButton;
    procedure btnReadClick(Sender: TObject);
    procedure btnLinksClick(Sender: TObject);
    procedure btnImagesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAnonAjax: TFormAnonAjax;

implementation

{$R *.dfm}

uses
  AnonAjax_Thread;

procedure TFormAnonAjax.btnReadClick(Sender: TObject);
begin
  AjaxCall (edUrl.Text,
    procedure (aResponseContent: TStringStream)
    begin
      Memo1.Lines.Text := aResponseContent.DataString;
      Memo1.Lines.Insert(0, 'From URL: ' + edUrl.Text);
    end);
end;

procedure TFormAnonAjax.btnLinksClick(Sender: TObject);
begin
  AjaxCall (edUrl.Text,
    procedure (aResponseContent: TStringStream)
    begin
      ExtractLinks(aResponseContent.DataString,
        procedure (const aUrl: string)
        begin
          Memo1.Lines.Add (aUrl + ' in ' + edUrl.Text);
        end);
    end);
end;

procedure TFormAnonAjax.btnImagesClick(Sender: TObject);
var
  nHit: Integer;
begin
  nHit := 0;
  AjaxCall (edUrl.Text,
    procedure (aResponseContent: TStringStream)
    begin
      ExtractImages(aResponseContent.DataString,
        procedure (const aUrl: string)
        begin
          Inc (nHit);
          Memo1.Lines.Add (IntToStr (nHit) + '.' +
            aUrl + ' in ' + edUrl.Text);
          if nHit = 1 then // load the first
          begin
            AjaxCall (aUrl,
              procedure (aResponseContent: TStringStream)
              begin
                // load image of the current type only
                Image1.Picture.Graphic.
                  LoadFromStream(aResponseContent);
              end);
          end;
        end);
    end);
end;

end.
