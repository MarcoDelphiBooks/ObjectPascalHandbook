unit IoFilesInFolderMainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFormIoFiles = class(TForm)
    btnSubfolders: TButton;
    edBaseFolder: TEdit;
    btnPasFiles: TButton;
    ListBox1: TListBox;
    lblFileInfo: TLabel;
    btnFilterFolders: TButton;
    StatusBar1: TStatusBar;
    btnFilterPasDpr: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnSubfoldersClick(Sender: TObject);
    procedure btnPasFilesClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnFilterFoldersClick(Sender: TObject);
    procedure btnFilterPasDprClick(Sender: TObject);
  private
    sFilesList: TStringList;
  end;

var
  FormIoFiles: TFormIoFiles;

implementation

{$R *.dfm}

uses
  Types, IOUtils, ShlObj, ComObj;

procedure TFormIoFiles.btnFilterFoldersClick(Sender: TObject);
var
  pathList: TStringDynArray;
  strPath: string;
  nTotal, nFound: Integer;
begin
  FreeAndNil (sFilesList); // disable ListBox OnClick
  if TDirectory.Exists (edBaseFolder.Text) then
  begin
    ListBox1.Items.Clear;
    nTotal := 0;
    nFound := 0;
    pathList := TDirectory.GetDirectories(edBaseFolder.Text,
      TSearchOption.soAllDirectories,
      function (const Path: string; const SearchRec: TSearchRec): Boolean
      begin
        Result := not (SearchRec.Name = '__history') and
          not (SearchRec.Name[1] = '.');
        Inc (nTotal);
        if Result then
          Inc (nFound);
        StatusBar1.SimpleText := Format ('Folders %d/%d', [nFound, nTotal]);
        Application.ProcessMessages;
      end);
    for strPath in pathList do
      ListBox1.Items.Add (strPath);
  end;
end;

procedure TFormIoFiles.btnFilterPasDprClick(Sender: TObject);
var
  pathList, filesList: TStringDynArray;
  strPath, strFile: string;
  nTotal, nFound: Integer;
begin
  if TDirectory.Exists (edBaseFolder.Text) then
  begin
    if not Assigned (sFilesList) then
      sFilesList := TStringList.Create
    else
      sFilesList.Clear;

    // clean up
    ListBox1.Items.Clear;

    // search in all subfolders
    pathList := TDirectory.GetDirectories(edBaseFolder.Text,
      TSearchOption.soAllDirectories,
      function (const Path: string; const SearchRec: TSearchRec): Boolean
      begin
        Result := not (SearchRec.Name = '__history') and
          not (SearchRec.Name[1] = '.');
        Application.ProcessMessages;
      end);
    // add the current folder
    SetLength(pathList, Length (pathList) + 1);
    pathList[High(pathList)] := edBaseFolder.Text;

    for strPath in pathList do
    begin
      filesList := TDirectory.GetFiles (strPath, '*.*',
        function (const Path: string; const SearchRec: TSearchRec): Boolean
        var
          strExt: string;
        begin
          strExt := TPath.GetExtension(SearchRec.Name);
          Result := (strExt = '.pas') or (strExt = '.dpr');
          Inc (nTotal);
          if Result then
            Inc (nFound);
          StatusBar1.SimpleText := Format ('Files %d/%d', [nFound, nTotal]);
          Application.ProcessMessages;
        end);
      for strFile in filesList do
        sFilesList.Add(strFile);
    end;

    // now copy the file names only (no path) to a listbox
    for strFile in sFilesList do
      ListBox1.Items.Add (TPath.GetFileName(strFile));
  end;end;

procedure TFormIoFiles.btnPasFilesClick(Sender: TObject);
var
  pathList, filesList: TStringDynArray;
  strPath, strFile: string;
begin
  if TDirectory.Exists (edBaseFolder.Text) then
  begin
    if not Assigned (sFilesList) then
      sFilesList := TStringList.Create
    else
      sFilesList.Clear;

    // clean up
    ListBox1.Items.Clear;

    // search in the given folder
    filesList := TDirectory.GetFiles (edBaseFolder.Text, '*.pas');
    for strFile in filesList do
      sFilesList.Add(strFile);

    // search in all subfolders
    pathList := TDirectory.GetDirectories(edBaseFolder.Text,
      TSearchOption.soAllDirectories, nil);
    for strPath in pathList do
    begin
      filesList := TDirectory.GetFiles (strPath, '*.pas');
      for strFile in filesList do
        sFilesList.Add(strFile);
    end;

    // now copy the file names only (no path) to a listbox
    for strFile in sFilesList do
      ListBox1.Items.Add (TPath.GetFileName(strFile));
  end;
end;

procedure TFormIoFiles.btnSubfoldersClick(Sender: TObject);
var
  pathList: TStringDynArray;
  strPath: string;
begin
  FreeAndNil (sFilesList); // disable ListBox OnClick
  if TDirectory.Exists (edBaseFolder.Text) then
  begin
    ListBox1.Items.Clear;
    pathList := TDirectory.GetDirectories(edBaseFolder.Text,
      TSearchOption.soAllDirectories, nil);
    for strPath in pathList do
      ListBox1.Items.Add (strPath);
  end;
end;

procedure TFormIoFiles.FormCreate(Sender: TObject);
var
  szBufferW: string;
begin
  SetLength (szBufferW, MAX_PATH);
  OleCheck (SHGetFolderPath (Handle, CSIDL_MYDOCUMENTS, 0, 0, PChar(szBufferW)));
  edBaseFolder.Text := string (szBufferW);
end;

procedure TFormIoFiles.FormDestroy(Sender: TObject);
begin
  FreeAndNil (sFilesList);
end;

procedure TFormIoFiles.ListBox1Click(Sender: TObject);
var
  strFileName: string;
begin
  if not Assigned (sFilesList) then
    Exit;
  strFileName := sFilesList[ListBox1.ItemIndex];
  lblFileInfo.Caption := strFileName + sLineBreak +
    'Creation: ' + DateTimeToStr (TFile.GetCreationTime(strFileName)) + sLineBreak +
    'LastAccess: ' + DateTimeToStr (TFile.GetLastAccessTime (strFileName)) + sLineBreak +
    'LastWrite: ' + DateTimeToStr (TFile.GetLastWriteTime(strFileName));
end;

initialization
  ReportMemoryLeaksOnShutdown := True;

end.
