unit ExceptionForm;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Memo;

type
  TFormExceptions = class(TForm)
    Memo1: TMemo;
    btnTraditional: TButton;
    btnCallNested: TButton;
    btnTwoNested: TButton;
    btnRaising: TButton;
    procedure btnTraditionalClick(Sender: TObject);
    procedure btnCallNestedClick(Sender: TObject);
    procedure btnTwoNestedClick(Sender: TObject);
    procedure btnRaisingClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Show (const msg: string);

    procedure ClassicReraise;
    procedure MethodWithNestedException;
    procedure MethodWithTwoNestedExceptions;
  end;

var
  FormExceptions: TFormExceptions;

implementation

{$R *.fmx}

type
  ECustomException = class (Exception)
  protected
    procedure RaisingException(P: PExceptionRecord); override;
  end;

procedure TFormExceptions.btnCallNestedClick(Sender: TObject);
begin
  try
    MethodWithNestedException;
  except
    on E: Exception do
    begin
      Show ('Message: ' + E.Message);
      Show ('ToString: ' + E.ToString);
      if Assigned (E.BaseException) then
        Show ('BaseException Message: ' + E.BaseException.Message);
      if Assigned (E.InnerException) then
        Show ('InnerException Message: ' + E.InnerException.Message);
    end;
  end;
end;

procedure TFormExceptions.btnRaisingClick(Sender: TObject);
begin
  raise ECustomException.Create('A message');
end;

procedure TFormExceptions.btnTraditionalClick(Sender: TObject);
begin
  try
    ClassicReraise;
  except
    on E: Exception do
      Show ('Message: ' + E.Message);
  end;
end;

procedure TFormExceptions.btnTwoNestedClick(Sender: TObject);
begin
  try
    MethodWithTwoNestedExceptions;
  except
    on E: Exception do
    begin
      Show ('Message: ' + E.Message);
      Show ('ToString: ' + E.ToString);
      if Assigned (E.BaseException) then
        Show ('BaseException Message: ' + E.BaseException.Message);
      if Assigned (E.InnerException) then
        Show ('InnerException Message: ' + E.InnerException.Message);
    end;
  end;
end;

procedure TFormExceptions.ClassicReraise;
begin
  try
    // do something...
    raise Exception.Create('Hello');
  except on E: Exception do
    // try some fix...
    raise Exception.Create('Another: ' + E.Message);
  end;
end;

procedure TFormExceptions.MethodWithNestedException;
begin
  try
    raise Exception.Create('Hello');
  except
    Exception.RaiseOuterException (Exception.Create('Another'));
  end;
end;

procedure TFormExceptions.MethodWithTwoNestedExceptions;
begin
  try
    raise Exception.Create('Hello');
  except
    begin
      try
        Exception.RaiseOuterException (Exception.Create('Another'));
      except
        Exception.RaiseOuterException (Exception.Create('A third'));
      end;
    end;
  end;
end;

procedure TFormExceptions.Show(const Msg: string);
begin
  Memo1.Lines.Add(Msg);
end;

{ ECustomException }

procedure ECustomException.RaisingException(P: PExceptionRecord);
begin
  // Show exception information (to file would be smarter!)
  FormExceptions.Show('Exception Addr: ' + IntToHex (
    Integer(P.ExceptionAddress), 8));
  FormExceptions.Show('Exception Mess: ' + Message);

  // modify the message
  Message := Message + ' (filtered)';

  // standard processing
  inherited;
end;


end.
