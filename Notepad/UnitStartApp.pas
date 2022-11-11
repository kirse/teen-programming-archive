unit UnitStartApp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ShellAPI;

type
  TRunAppForm = class(TForm)
    StartAppPath: TEdit;
    cmdBrowse: TButton;
    cmdRun: TButton;
    BrowseDialog: TOpenDialog;
    procedure StartAppPathKeyPress(Sender: TObject; var Key: Char);
    procedure cmdBrowseClick(Sender: TObject);
    procedure cmdRunClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RunAppForm: TRunAppForm;

implementation

uses UnitMain;

{$R *.dfm}

procedure TRunAppForm.StartAppPathKeyPress(Sender: TObject; var Key: Char);
begin
        if Key = '`' then
        begin
                RunAppForm.Hide;
                Main.ExtraMenu.Visible := False;
        end;

end;

procedure TRunAppForm.cmdBrowseClick(Sender: TObject);
begin
        BrowseDialog.Execute;
        StartAppPath.Text := BrowseDialog.FileName;
end;

procedure TRunAppForm.cmdRunClick(Sender: TObject);
var
        StartString: PChar;
begin
        StartString := PChar(StartAppPath.Text);
        ShellExecute(0,nil,StartString,nil,nil,1);
end;

end.
