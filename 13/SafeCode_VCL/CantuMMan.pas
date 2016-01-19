unit CantuMMan;

interface

var
  GetMemCount: Integer = 0;
  FreeMemCount: Integer = 0;
  ReallocMemCount: Integer = 0;

// save to a file the list of active memory blocks,
//  with a short description of each
procedure SnapToFile (Filename: string);

// checks whether a pointer falls within the range of
// active memory blocks on the heap:
// - this test can be applied to strings, objects, generic buffers
// - cannot be applied to class references, functions/method pointers
//   constants and other globals
function IsPointerWithinHeap (Address: Pointer): Boolean;

// checks if a pointer refers to the beginning of a memory block
// (object, buffer, etc). Don't use it for strings!
function IsPointerToBlock (Address: Pointer): Boolean;

implementation

uses
  Windows, SysUtils, TypInfo, CantuMemTest;

var
  OldMemMgr: TMemoryManager;
  ObjList: array [1..10000] of Pointer;
  FreeInList: Integer = 1;

procedure AddToList (P: Pointer);
begin
  if FreeInList > High (ObjList) then
  begin
    MessageBox (0, 'List full', 'MemMan', mb_ok);
    Exit;
  end;
  ObjList [FreeInList] := P;
  Inc (FreeInList);
end;

procedure RemoveFromList (P: Pointer);
var
  I: Integer;
begin
  for I := 1 to FreeInList - 1 do
    if ObjList [I] = P then
    begin
      // remove element shifting down the others
      Dec (FreeInList);
      Move (ObjList [I+1], ObjList [I],
        (FreeInList - I) * sizeof (pointer));
      Exit;
    end;
end;

type
  TDumpMemory = procedure (var OutFile: TextFile) of object;

function IsPointerWithinHeap (Address: Pointer): Boolean;
begin
  Result := True;
  if Assigned (Address) and (FindHInstance (Address) > 0) and
      (Cardinal(Address) >= Cardinal(ObjList [1])) and
      (Cardinal(Address) <= Cardinal(ObjList [FreeInList - 1])) then
    Result := True;
end;

function IsPointerToBlock (Address: Pointer): Boolean;
var
  I: Integer;
begin
  Result := False;
  if IsPointerWithinHeap (Address) then
  begin
    for I := 1 to FreeInList - 1 do
      if Address = ObjList [I] then
      begin
        Result := true;
        Exit;
      end;
  end;
end;


procedure SnapToFile (Filename: string);
var
  dumper: TMethod;
  OutFile: TextFile;
  I, CurrFree: Integer;
  HeapStatus: THeapStatus;
  Item: TObject;
  strlen, strref: cardinal;
  // ptd: PTypeData;
  // ppi: PPropInfo;
  vmtpointer, pch: pchar;
begin
  AssignFile (OutFile, Filename);
  try
    Rewrite (OutFile);
    CurrFree := FreeInList;
    // local heap status
    HeapStatus := GetHeapStatus;
    with HeapStatus do
    begin
      write (OutFile, 'Available address space: ');
      write (OutFile, TotalAddrSpace div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Uncommitted portion: ');
      write (OutFile, TotalUncommitted div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Committed portion: ');
      write (OutFile, TotalCommitted div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Free portion: ');
      write (OutFile, TotalFree div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Allocated portion: ');
      write (OutFile, TotalAllocated div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Address space load: ');
      write (OutFile, TotalAllocated div
        (TotalAddrSpace div 100));
      writeln (OutFile, '%');
      write (OutFile, 'Total small free blocks: ');
      write (OutFile, FreeSmall div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Total big free blocks: ');
      write (OutFile, FreeBig div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Other unused blocks: ');
      write (OutFile, Unused div 1024);
      writeln (OutFile, ' Kbytes');
      write (OutFile, 'Total overhead: ');
      write (OutFile, Overhead div 1024);
      writeln (OutFile, ' Kbytes');
    end;

    // custom memory manager information
    writeln (OutFile); // free line
    write (OutFile, 'Memory objects: ');
    writeln (OutFile, CurrFree - 1);

    // for each memory block
    for I := 1 to CurrFree - 1 do
    begin
      write (OutFile, I);
      write (OutFile, ') ');
      write (OutFile, IntToHex (
        Cardinal (ObjList [I]), 8));
      write (OutFile, ': ');
      try
        // strings
        pch := ObjList [I];
        if IsPointerToStringBlock (pch) then
        begin
          strlen := pinteger(pch+4)^;
          strref := pinteger(pch)^;
          write (outFile, ' string: [');
          write (OutFile, strlen);
          write (OutFile, '-');
          write (OutFile, strref);
          write (OutFile, ']: ');
          // move to the actual string
          pch := pch + 8;
          while pch^ <> #0 do
          begin
            write (OutFile, pch^);
            inc (pch);
          end;
        end
        else
        begin
          // is it an object?
          Item := TObject(ObjList [I]);
          vmtpointer := pchar((ObjList [I])^);
          if Assigned (vmtpointer) and (FindHInstance (vmtpointer) > 0) then
          begin
            if IsPointerToObject (Item) then
            begin // it is an object
              write (outFile, ' object: [');
              write (OutFile, Item.ClassName);
              write (outFile, ' - ');
              write (OutFile, Item.InstanceSize);
              write (OutFile, '] ');

              dumper.Code := Item.MethodAddress ('DumpMemory');
              if Assigned (dumper.Code) then
              begin
                writeln (OutFile);
                dumper.Data := Item;
                TDumpMemory(dumper)(outFile);
              end;
              (*if (Item.ClassInfo <> nil) and
                (FindHInstance (Item.ClassInfo) > 0) then
              begin
                ptd := GetTypeData (PTypeInfo (Item.ClassInfo));
                if ptd <> nil then
                begin
                  // name, if a component
                  if (Item.ClassName <> 'TFont') and
                    isPublishedProp (Item, 'Name') then
                  begin
                    write (OutFile, GetStrProp (Item, 'Name'));
                    {ppi := GetPropInfo (PTypeInfo (Item.ClassInfo), 'Name');
                    if ppi <> nil then
                      write (OutFile, GetStrProp (Item, ppi));}
                  end;
                end;
              end;*)
            end // an object
            else
            // is this a valid pointer to heap
            if IsPointerWithinHeap (vmtpointer) then
            begin
              write (outFile, ' buffer with heap pointer [');
              write (outFile, IntToHex (Cardinal (vmtpointer), 8));
              write (outFile, ']');
            end
            else
            begin
               // still a valid pointer, but not to heap
              write (outFile, ' buffer with pointer [');
              write (outFile, IntToHex (Cardinal (vmtpointer), 8));
              write (outFile, ']');
            end;
          end
          else
          begin
            // buffer with undefined data
            write (outFile, ' buffer: [');
            write (outFile, IntToHex (Cardinal (pinteger(ObjList [I])^), 8));
            {pch := ObjList [I];
            for j := 0 to 3 do
            begin
              write (OutFile, Byte((pch+j)^));
              write (OutFile, ' ');
            end;}
            write (OutFile, ']');
          end;
        end; // string else object
      except
        on Exception do
          write (OutFile, 'memman error');
      end;
      writeln (OutFile);
    end; // for
  finally
    CloseFile (OutFile);
  end;
end;

function NewGetMem (Size: Integer): Pointer;
begin
  Inc (GetMemCount);
  Result := OldMemMgr.GetMem (Size);
  AddToList (Result);
end;

function NewFreeMem (P: Pointer): Integer;
begin
  Inc (FreeMemCount);
  Result := OldMemMgr.FreeMem (P);
  RemoveFromList (P);
end;

function NewReallocMem (P: Pointer; Size: Integer): Pointer;
begin
  Inc (ReallocMemCount);
  Result := OldMemMgr.ReallocMem (P, Size);
  // remove older object
  RemoveFromList (P);
  // add new one
  AddToList (Result);
end;

const
  NewMemMgr: TMemoryManager = (
    GetMem: NewGetMem;
    FreeMem: NewFreeMem;
    ReallocMem: NewReallocMem);

initialization
  GetMemoryManager(OldMemMgr);
  SetMemoryManager(NewMemMgr);

finalization
  SetMemoryManager(OldMemMgr);
  if (GetMemCount - FreeMemCount) <> 0 then
    MessageBox (0, pChar ('Objects left: ' +
      IntToStr (GetMemCount - FreeMemCount)),
      'MemManager', mb_ok);
end.
