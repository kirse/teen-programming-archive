unit UnitGotoLine;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TGotoForm = class(TForm)
    LineNum: TEdit;
    cmdOk: TBitBtn;
    cmdCancel: TBitBtn;
    procedure cmdCancelClick(Sender: TObject);
    procedure cmdOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GotoForm: TGotoForm;

implementation

uses UnitMain;

{$R *.dfm}

procedure TGotoForm.cmdCancelClick(Sender: TObject);
begin
        GotoForm.Close;
end;

procedure TGotoForm.cmdOkClick(Sender: TObject);
begin
  Main.Text.Lines.Insert(StrToInt(LineNum.Text),'');
  Main.Text.Lines.Delete(StrToInt(LineNum.Text));
  GotoForm.Close;
end;

end.
