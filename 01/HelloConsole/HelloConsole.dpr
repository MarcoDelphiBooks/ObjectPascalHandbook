program HelloConsole;

{$APPTYPE CONSOLE}

var
  strMessage: string;

begin
  strMessage := 'Hello, World';
  writeln (strMessage);
  // wait until the Enter key is pressed
  readln;
end.
