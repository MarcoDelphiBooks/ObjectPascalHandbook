unit adapter_intf;

interface

type
  ITextAndValue = interface
    ['{51018CF1-0D3C-488E-81B0-0470B09013EB}']
    procedure SetText(const Value: string);
    procedure SetValue(const Value: Integer);
    function GetText: string;
    function GetValue: Integer;
    property Text: string read GetText write SetText;
    property Value: Integer read GetValue write SetValue;
  end;

implementation

end.
