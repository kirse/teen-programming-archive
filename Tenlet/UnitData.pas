unit UnitData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UnitASCII;

type
  TDataTag = class(TForm)
    chkBefore: TCheckBox;
    chkAfter: TCheckBox;
    Label1: TLabel;
    PreData: TEdit;
    PostData: TEdit;
    chkReturn: TCheckBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataTag: TDataTag;

implementation

{$R *.dfm}
end.
