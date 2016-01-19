unit CantuMemTest;

interface

uses
  SysUtils, Windows;

// tries to extract the pointer to the class which is at the
// beginning of an object memory block, and checks whether this
// is actually a class (empirically)
function IsPointerToObject (Address: Pointer): Boolean;

// verifies if an address is the address of a string (by looking to its
// reference count and length information). First version to be used with the
// pchar extracted by a string, the second with a pointer to a memory block
// including a string
function IsPointerToString (Address: Pointer): Boolean;
function IsPointerToStringBlock (Address: Pointer): Boolean;

implementation

function IsPointerToObject (Address: Pointer): Boolean;
var
  classPointer, vmtPointer: PChar;
  instsize: Integer;
begin
  Result := False;
  if (FindHInstance (Address) > 0) then
  begin
    vmtpointer := pchar(Address^);
    classpointer := vmtpointer + vmtSelfPtr;
    if Assigned (vmtpointer) and (FindHInstance (vmtpointer) > 0) then
    begin
      instsize := (PInteger(vmtpointer + vmtInstanceSize))^;
      // check self pointer and "reasonable" instance size
      if (pointer(pointer(classpointer)^) = pointer(vmtpointer)) and
          (instsize > 0) and (instsize < 10000) then
        Result := True;
    end;
  end;
end;

function IsPointerToString (Address: Pointer): Boolean;
begin
  Result := IsPointerToStringBlock (pChar(Address)-8);
end;

function IsPointerToStringBlock (Address: Pointer): Boolean;
var
  strlen: cardinal;
  strref: Integer;
  pch: PChar;
begin
  // NOTICE: this is rough!!!
  Result := False;
  if (FindHInstance (Address) > 0) then
  begin
    pch := Address;
    strlen := pinteger(pch+4)^;
    strref := pinteger(pch)^;
    pch := pch + 8;
    // is this a string?
    if ((strref >= -1) and (strref < 100)) and
        ((strlen < 1000000) or (strlen = sysutils.strlen (pch+8))) then
      Result := True;
  end;
end;

end.
