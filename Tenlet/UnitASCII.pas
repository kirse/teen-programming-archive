unit UnitASCII;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TASCII = class(TForm)
    Label1: TLabel;
    AsciiValue: TEdit;
    Label2: TLabel;
    OK: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ASCII: TASCII;

implementation

{$R *.dfm}

end.
